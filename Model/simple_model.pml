#define N   3

mtype = {request, bigData, smallData, continue, stop};

// witnessess
bool dC = false;      // doneCollecting
bool msgSent = false; // stopcollection message sent. 

// ltl formula
/* 
  The correctness property 'toNotCollect' is currently modeled as:
   * If the message is sent (the server is notified), 
       the decision is taken and the system should eventually
       stop collecting.
*/
ltl toNotCollect { always msgSent implies eventually dC } 

/* 

  Liveness property 

  * States the program should keep collecting until the decision is sent.

  */
//ltl keepCollecting { !dC W msgSent }

chan envChan = [0] of {mtype};
chan servChan = [1] of {mtype};

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
      printf("E: My work is never over.\n");
}

active proctype Node() {
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
      do
      :: servChan ? continue -> goto Idle;
      :: servChan ? stop -> break;
      od;
      printf("N: Ok, done collecting.\n");
      dC = true;
}

active proctype Server() {
      printf("S: starting up.\n");
Idle: if
      :: servChan ? smallData -> 
          servChan ! continue; 
          goto Idle;
      :: servChan ? bigData -> 
          servChan ! stop; 
          msgSent = true; 
          printf("S: msgSent. Shutting down.\n");
      fi
}


