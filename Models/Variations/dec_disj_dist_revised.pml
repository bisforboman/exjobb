#define NUM_NODES   1
//#define dC          (cN == 0) 
#define node_send       Node@Waiting // node 0 arrived at waiting
#define server_dC       Server@Stopping
#define node_done       Node@DoneColl
//#define server_ans      Server@Answering
//#define server_stop     Server@Stopping
#define bigData_metered Env@Idle_bigData

// ack is an extension for decentralized 
mtype = {meter, bigData, smallData, continue, stop, ack};

// channel inits.
chan envChan = [0] of {mtype};
chan servChan[NUM_NODES] = [1] of {mtype};
chan broadChan = [0] of {mtype}; // broadcast channel between server & network
chan networkChan[NUM_NODES] = [1] of {mtype}; // channel for network actor to nodes.

/* Correctness */
//ltl correctness { always (server_dC implies (eventually node_done)) }

/* Liveness */
//ltl liveness { (not node_notify until bigData_metered) }


init {
  atomic {
    int i;
    for (i : 0  .. (NUM_NODES-1)) {
      run Node(servChan[i], networkChan[i]);
    }
  }
}

/* Extension made to manage broadcasts */
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

Answering: 
        if
        :: servChan[j] ? smallData -> 
            servChan[j] ! continue; 
            goto Idle_Answering;
        :: servChan[j] ? stop ->
            servChan[j] ! ack; // respond
            broadChan ! stop; // broadcast
            goto Idle_Stopping;
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

Stopping:    
        if
        :: servChan[j] ? smallData -> 
            servChan[j] ! continue; // maybe should be "ack" 
            goto Idle_Stopping;
        :: servChan[j] ? stop ->
            servChan[j] ! ack;
            goto Idle_Stopping;
        fi;
        
}

proctype Node(chan out, broadcast) {

Check: // to listen to broadcasts aswell.
        if
        :: nempty(broadcast) -> 
            broadcast ? stop -> goto DoneColl;
        :: empty(broadcast) ->  
        fi;

Idle:   
        envChan ! meter; 
        // node will take decision here.
        if
        :: envChan ? bigData ->
           out ! stop;  
           goto Waiting;
        :: envChan ? smallData ->
           out ! smallData;  
           goto Waiting;
        fi;

Waiting: // here the node notifies the server.
        atomic {
          if 
          :: out ? continue -> goto Check;
          :: out ? ack -> 
          fi; 
        }
DoneColl: 
        // node will shutdown here.
}
