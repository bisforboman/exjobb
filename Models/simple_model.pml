#define NUM_NODES   2
#define dC          (cN == 0) 
// dC: doneCollecting, referring to the nodes.

mtype = {meter, bigData, smallData, continue, stop};

// witnessess
bool oC = false; // over-collection occured
int cN = 0; // cN: collectingNodes, ...

/* 
   * If the message is sent (the server is notified), 
       the decision is taken and the system should eventually
       stop collecting.
*/
//ltl correctness { always (oC implies (X (eventually dC))) && (eventually dC) }
ltl correctness { always (oC implies (eventually dC)) }

/* 

  Liveness property 

  * States the program should keep collecting until overcollection

  */
//ltl liveness { (!dC until msgSent) }

chan envChan = [0] of {mtype};
chan servChan = [NUM_NODES] of {mtype};

active proctype Env() {
      //printf("E: starting up.\n");
    /* atomic here is used to simulate that the data is gathered from the 
        environment without interleaving actions, meaning a node can do this 
        "instantly". 
        d_step didn't allow goto's which is why atomic was used instead. */
Idle: if
end:  :: atomic { 
          envChan ? meter -> 
           do // random outcome 
           :: envChan ! smallData; break;
           :: envChan ! bigData; break;
           od; 
           goto Idle;
        }
       fi
       //printf("E: No one collecting. Shutting down.\n"); 
}

active proctype Server() {
      mtype defAns = continue;
//      printf("S: starting up.\n");
Idle:   if
end_1:  :: servChan ? smallData -> 
//          printf("S: smallData.\n");
            servChan ! defAns; 
            goto Idle;
        :: servChan ? bigData -> 
//          printf("S: Overcollection!\n");
            servChan ! stop;
            goto OverC;
        fi;
OverC:  if
end_2:  :: servChan ? smallData -> 
            servChan ! stop; 
            goto OverC;
        :: servChan ? bigData -> 
            oC = true;
            servChan ! stop;
            goto OverC;
        fi;
//      printf("S: Shutting down.\n");
}

active [NUM_NODES] proctype Node() {
       cN++;
//      printf("N: starting up.\n");
Idle: 
end:   envChan ! meter; 
       if
       :: envChan ? bigData -> 
//          printf("N: Collected bigData from E.\n");
          servChan ! bigData; 
          goto Waiting;
       :: envChan ? smallData -> 
//          printf("N: Collected smallData from E.\n");
          servChan ! smallData; 
          goto Waiting;
       fi;
Waiting:
       atomic {
         if
         :: servChan ? continue -> goto Idle;
         :: servChan ? stop -> cN--; 
         fi;
       }
//      printf("N: Ok, done collecting.\n"); 
 
}
