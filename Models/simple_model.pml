#define NUM_NODES   1
#define dC          (cN == 0) 
// dC: doneCollecting, referring to the nodes.
// cN: collectionNodes, ...

mtype = {request, bigData, smallData, continue, stop};

// witnessess
//bool dC = false; // means that no nodes are collecting
bool oC = false; // over-collection occured

int cN = NUM_NODES;

/* 
   * If the message is sent (the server is notified), 
       the decision is taken and the system should eventually
       stop collecting.
*/
//ltl correctness { (always (msgSent implies (X (eventually dC)))) && (eventually dC) } 
ltl correctness { always (oC implies (X (eventually dC))) && (eventually dC) }


/* 
   * If the message is sent (the server is notified), 
       the decision is taken and the system should eventually
       stop collecting.
*/
//ltl correctness { (always (msgSent implies (X (eventually dC)))) && (eventually dC) } 

/* 

  Liveness property 

  * States the program should keep collecting until the decision is sent.

  */
//ltl liveness { (!dC until msgSent) }

chan envChan = [0] of {mtype};
chan servChan = [0] of {mtype};

active proctype Env() {
    printf("E: starting up.\n");
Idle: if
      :: envChan ? request -> 
          do // random outcome 
          :: envChan ! smallData; break;
          :: envChan ! bigData; break;
          od; 
         goto Idle;
      :: dC ->    
      fi
      printf("E: No one collecting. Shutting down.\n");
}

active proctype Server() {
      mtype defAns = continue;
      printf("S: starting up.\n");
Idle: if
      :: servChan ? smallData -> 
          servChan ! defAns; 
          goto Idle;
      :: servChan ? bigData -> 
          oC = true;
          defAns = stop;
          servChan ! stop;
          goto Idle;
      :: dC ->
      fi;
      printf("S: msgSent. Shutting down.\n");
}

active [NUM_NODES] proctype Node() {
      mtype ans;
      printf("N: starting up.\n");
Idle: 
      envChan ! request; 
      if
      :: envChan ? bigData -> 
          servChan ! bigData; 
          printf("N: Collected bigData from E.\n");
          goto Waiting;
      :: envChan ? smallData -> 
          servChan ! smallData; 
          printf("N: Collected smallData from E.\n");
          goto Waiting;
      fi;
Waiting:
      servChan ? ans;
      if
      :: ans == continue -> goto Idle;
      :: ans == stop -> 
      fi;
      printf("N: Ok, done collecting.\n");
      cN--;
}

