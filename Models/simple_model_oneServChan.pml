#define NUM_NODES   1
//#define dC          (cN == 0) 
#define node_send       Node@waiting // node 0 arrived at waiting
#define server_dC       Server@Accept_oc
#define node_done       Node@DoneColl
//#define n_end       Node[NUM_NODES]@end // node 0 stopped
// dC: doneCollecting, referring to the nodes.

mtype = {meter, bigData, smallData, continue, stop};

// witnessess
//bool sC = false; // stopCollecting
//bool oC = false; // over-collection occured
//int cN = NUM_NODES; // cN: collectingNodes, ... 

/* 
   * If the message is sent (the server is notified), 
       the decision is taken and the system should eventually
       stop collecting.
*/
//ltl correctness_old { always (oC implies (eventually dC))  }
//ltl correctness { always (server_dC implies (eventually node_done)) }

/* 

  Liveness property 

  * States the program should keep collecting until overcollection

  */
//ltl liveness_send { (eventually (node_send)) }
//ltl liveness_reply { always (node_send implies ()) }
//ltl liveness { (always !sC) || (eventually dC) }


// channel inits.
chan envChan = [0] of {mtype};
chan servChan = [NUM_NODES] of {mtype};

init {
  atomic {
    int i;
    for (i : 1  .. NUM_NODES) {
      run Node();
    }
    run Server();
  }
}


active proctype Env() {
//      printf("E: starting up.\n");
    /* atomic here is used to simulate that the data is gathered from the 
        environment without interleaving actions, meaning a node can do this 
        "instantly". 
        d_step didn't allow goto's which is why atomic was used instead. */

Accept_e_idle:  
      if
      :: atomic { 
          envChan ? meter ->  
           if // random outcome 
           :: envChan ! bigData;
           :: envChan ! smallData;
           fi; 
          goto Accept_e_idle;
        }
      fi;
//       printf("E: No one collecting. Shutting down.\n"); 
}

proctype Server() {
//      printf("S: starting up.\n");
   
Accept_idle: 
        if
        :: servChan ? smallData -> 
//            printf("S: smallData. Go... \n");
            servChan ! continue; 
            goto Accept_idle;
        :: servChan ? bigData -> 
//            printf("S: bigData. no more ... \n");
//            sC = true;
            servChan ! stop;
            goto Accept_oc;
        fi;
Accept_oc:    
        if
        :: servChan ? smallData -> 
//            printf("S: smallData. Stop! \n");
            servChan ! stop; 
            goto Accept_oc;
        :: servChan ? bigData -> 
//            printf("S: Overcollection!\n");
//            oC = true;
            servChan ! stop;
            goto Accept_oc;
        fi;
//      printf("S: Shutting down.\n");
}

proctype Node() {
//       cN++;
//       printf("N: starting up.\n");
Accept_n_idle:   
        envChan ! meter; 
        if
        :: envChan ? bigData -> 
//          printf("N: Collected bigData from E.\n");
           servChan ! bigData; 
           goto waiting;
        :: envChan ? smallData -> 
//          printf("N: Collected smallData from E.\n");
           servChan ! smallData; 
           goto waiting;
        fi;
waiting:
        atomic {
          if
          :: servChan ? continue -> goto Accept_n_idle;
          :: servChan ? stop -> // cN--; 
          fi;
        }
DoneColl: 
//      printf("N: Ok, done collecting.\n"); 
}
