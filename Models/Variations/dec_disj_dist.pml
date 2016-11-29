#define NUM_NODES   1
//#define dC          (cN == 0) 
#define node_send       Node@Waiting // node 0 arrived at waiting
#define server_dC       Server@Stopping
#define node_done       Node@DoneColl
#define server_ans      Server@Answering
#define server_stop     Server@Stopping
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

  * Liveness_send states that eventually a node gets to send data to the server.
  * Liveness_reply states that when a node has sent, eventually the server responds accordingly.

  */
//ltl liveness_send { (eventually (node_send)) }
//ltl liveness_reply { (node_send implies (eventually (server_ans || server_stop))) }


// channel inits.
chan servChan[NUM_NODES] = [1] of {mtype};
chan broadChan = [0] of {mtype}; // broadcast channel
chan networkChan[NUM_NODES] = [1] of {mtype}; // channel for network actor to nodes.

init {
  atomic {
    chan envChan = [0] of {mtype};
    run Env(envChan);
    int i;
    for (i : 0  .. (NUM_NODES-1)) {
      run Node(servChan[i], envChan, networkChan[i]);
    }
  }
}

active proctype Network() {
  if 
  :: broadChan ? stop ->
      for(i : 0 .. (NUM_NODES-1)) {
        networkChan ! stop;
      } 
  fi
}

proctype Env(chan envChan) {

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
}

active proctype Server() {

// initializing active channel
int i=0,j=0;

// in the label that start with "idle_" the server will only check
//    if any data is put on one of the channels each in turn.
Idle_Answering: 
        if
        :: nempty(servChan[i]) -> 
            j=i;
            i=(i+1)%NUM_NODES;
            goto Answering; 
        :: empty(servChan[i]) ->
            i=(i+1)%NUM_NODES;
            goto Idle_Answering;
        fi;

Idle_Stopping:
        if
        :: nempty(servChan[i]) -> 
            j=i;
            i=(i+1)%NUM_NODES;
            goto Stopping; 
        :: empty(servChan[i]) ->
            i=(i+1)%NUM_NODES;
            goto Idle_Stopping;
        fi;

Answering: 
        if
        :: servChan[j] ? smallData -> 
            servChan[j] ! continue; 
            goto Idle_Answering;
        :: servChan[j] ? bigData ->
            servChan[j] ! stop;
            goto Idle_Stopping;
        fi;

Stopping:    
        if
        :: servChan[j] ? smallData -> 
            servChan[j] ! stop; 
            goto Idle_Stopping;
        :: servChan[j] ? bigData ->
            servChan[j] ! stop;
            goto Idle_Stopping;
        fi;
}

proctype Node(chan out, envChan, broadcast) {
Idle:   // if stop is broadcasted the nodes should stop.
        if
        :: nempty(broadcast) -> 
            broadcast ? stop -> goto DoneColl;
        fi;

        envChan ! meter; 
        if
        :: envChan ? bigData -> 
           out ! bigData; 
           goto Waiting;
        :: envChan ? smallData -> 
           out ! smallData; 
           goto Waiting;
        fi;
Waiting:
        atomic {
          if
          :: out ? continue -> goto Idle;
          :: out ? stop -> 
          fi;
        }
DoneColl: // node will shutdown here.
}