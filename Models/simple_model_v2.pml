#define NUM_NODES   3

mtype = {request, bigData, smallData, continue, stop};

// witnessess
bool dC = false;      // doneCollecting
bool msgSent = false; // stopcollection message sent. 

/* 
   * If the message is sent (the server is notified), 
       the decision is taken and the system should eventually
       stop collecting.
*/
ltl correctness { (always (msgSent implies (X (eventually dC)))) && (eventually dC) } 

/* 

  Liveness property 

  * States the program should keep collecting until the decision is sent.

  */
//ltl liveness { (!dC until msgSent) }

// Defined by the number of nodes(N).
chan envChan = [NUM_NODES] of {int, mtype};
chan servChan = [NUM_NODES] of {int, mtype};


init {
    
  run Environment(envChan);    
  run Server(servChan);  

  int i = 0;

  do
  :: i >= NUM_NODES -> break
  :: else -> run Node(i); i++
  od
  printf("Initially created %d nodes!\n", i)
}

proctype Environment(chan ch) {
    int id;
    printf("E: starting up.\n");
Idle: if
      :: ch ? id,request -> 
          do // random outcome 
          :: ch ! id,smallData; break;
          :: ch ! id,bigData; break;
          od; 
         goto Idle;
      :: dC ->    
      fi
      printf("E: No one collecting. Shutting down.\n");
}

proctype Server(chan ch) {
      int id;
      printf("S: starting up.\n");
Idle: if
      :: ch ? id, smallData -> // receiving smallData from node
          ch ! id, continue; 
          goto Idle;
      :: ch ? id, bigData -> // receiving bigData from node (OC cause!)
          ch ! id, stop;
          msgSent = true; 
      fi;
      printf("S: msgSent. Shutting down.\n");
}

proctype Node(int id) {
      printf("N%d: starting up.\n",id);
Idle: 
      envChan ! id,request; 
      if
      :: envChan ? id,bigData -> 
          servChan ! id,bigData; 
          printf("N%d: Collected bigData from E.\n",id);
          goto Waiting;
      :: envChan ? id,smallData -> 
          servChan ! id,smallData; 
          printf("N%d: Collected smallData from E.\n",id);
          goto Waiting;
      fi;
Waiting:
      do
      :: servChan ? id,continue -> goto Idle;
      :: servChan ? id,stop -> break;
      od;
      printf("N%d: Ok, done collecting.\n",id);
      dC = true;
}




