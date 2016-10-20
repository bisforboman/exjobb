#define NUM_NODES   2
#define dC          (cN == 0) 
// dC: doneCollecting, referring to the nodes.
// cN: collectionNodes, ...

mtype = {request, bigData, smallData, continue, stop};

// witnessess
//bool dC = false; // means that no nodes are collecting
bool oC = false; // over-collection occured

int cN = 0;

/* 
   * If the message is sent (the server is notified), 
       the decision is taken and the system should eventually
       stop collecting.
*/
//ltl correctness { (always (msgSent implies (X (eventually dC)))) && (eventually dC) } 
ltl correctness { always (oC implies (X (eventually dC))) && (eventually dC) }

/* 

  Liveness property 

  * States the program should keep collecting until the decision is sent.

  */
//ltl liveness { (!dC until msgSent) }

chan envChan = [NUM_NODES] of {mtype};
chan servChan = [NUM_NODES] of {mtype};

active proctype Env() {
    printf("E: starting up.\n");
Idle: if
     :: envChan ? request -> 
        /* atomic here is used to simulate that the data is gathered from the environment without 
            interleaving actions, meaning a node do this "instantly". d_step didn't allow goto's which 
            is why atomic was used instead. */
        atomic {
          do // random outcome 
          :: envChan ! smallData; break;
          :: envChan ! bigData; break;
          od; 
          goto Idle;
        }
      :: dC ->    
      fi
      printf("E: No one collecting. Shutting down.\n");
end: 
}

active proctype Server() {
      mtype defAns = continue;
      printf("S: starting up.\n");
Idle: if
      :: servChan ? smallData -> 
          printf("S: smallData.\n");
          servChan ! defAns; 
          goto Idle;
      :: servChan ? bigData -> 
          printf("S: Overcollection!\n");
          oC = true;
          defAns = stop;
          servChan ! stop;
          goto Idle;
      :: dC ->
      fi;
      printf("S: Shutting down.\n");
end: 
}

active [NUM_NODES] proctype Node() {
      cN++;
      printf("N: starting up.\n");
Idle: 
      envChan ! request; 
      if
      :: envChan ? bigData -> 
          printf("N: Collected bigData from E.\n");
          servChan ! bigData; 
          goto Waiting;
      :: envChan ? smallData -> 
          printf("N: Collected smallData from E.\n");
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
      printf("N: Ok, done collecting.\n"); 
end: 
}

