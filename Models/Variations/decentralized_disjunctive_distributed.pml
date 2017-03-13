#define NUM_NODES   1
#define node_done       Node@DoneColl
#define node_notify     Node@Broadcast
#define bigData_metered Env@Idle_bigData

mtype = {meter, bigData, smallData, continue, stop};


/* 
   * If the message is sent (the server is notified), 
       the decision is taken and the system should eventually
       stop collecting.
*/
//ltl correctness { always (server_dC implies (eventually node_done)) }

/* 
  Liveness property 
  */
ltl liveness { (not node_notify until bigData_metered) }


// channel inits.
chan envChan = [0] of {mtype};
chan servChan[NUM_NODES] = [1] of {mtype};
chan broadChan = [0] of {mtype}; // broadcast channel between server & network
chan networkChan[NUM_NODES] = [1] of {mtype}; // channel for network actor to nodes.

init {
  atomic {
    int i;
    for (i : 0  .. (NUM_NODES-1)) {
      run Node(servChan[i], networkChan[i]);
    }
  }
}

active proctype Network() {
  int i=0;
Idle: 
  if 
  :: atomic {
      broadChan ? stop ->
      for(i : 0 .. (NUM_NODES-1)) {
        networkChan[i] ! stop;
      }
    }
  fi;
}

active proctype Env() {

    /* atomic here is used to simulate that the data is gathered from the 
        environment without interleaving actions, meaning a node can do this 
        "instantly". 
        d_step didn't allow goto's which is why atomic was used instead. */

Idle:  
      if
      :: atomic { 
          envChan ? meter ->  
           if // random outcome 
           :: envChan ! bigData; goto Idle_bigData;
           :: envChan ! smallData;
           fi; 
          goto Idle;
        }
      fi;

  /* This is a extension for the environment so be able to track a state
  where bigData has been sent and the language is the same for both automata  */
Idle_bigData:
      if
      :: atomic { 
          envChan ? meter ->  
           if // random outcome 
           :: envChan ! bigData;
           :: envChan ! smallData;
           fi; 
          goto Idle_bigData;
        }
      fi;       
}

active proctype Server() {

int i=0, j=0;

Idle: 
      if
      :: nempty(servChan[i]) -> 
          j=i;
          i=(i+1)%NUM_NODES;
          goto Waiting; 
      :: empty(servChan[i]) ->
          i=(i+1)%NUM_NODES;
          goto Idle;
      fi;

Waiting: 
      if
      :: servChan[j] ? continue -> 
         goto Idle;
      :: servChan[j] ? stop ->
         broadChan ! stop;
         goto Idle;
      fi;

}

proctype Node(chan out, broadcast) {

Idle:   
        if
        :: nempty(broadcast) -> 
            broadcast ? stop -> goto DoneColl;
        :: empty(broadcast) ->  
        fi;

        envChan ! meter; 

Check:  
        if
        :: envChan ? bigData -> 
           goto Broadcast;
        :: envChan ? smallData -> 
           goto Idle;
        fi;

Broadcast: out ! stop;
DoneColl: // node will shutdown here.
}