#define NUM_NODES   1
#define node_send       Node@Waiting 
#define server_dC       Server@Stopping
#define node_done       Node@DoneColl
#define server_ans      Server@Answering
#define server_stop     Server@Stopping

mtype = {meter, bigData, smallData, continue, stop, ack};

/* 
   * If the message is sent (the server is notified), 
       the decision is taken and the system should eventually
       stop collecting.
*/
//ltl correctness { always (server_dC implies (eventually node_done)) }

/* 

  Liveness property 

  * Liveness_send states that eventually a node gets to send data to the server.
  * Liveness_reply states that when a node has sent, eventually the server responds accordingly.

  */
//ltl liveness { (not node_notify until bigData_metered) }


// channel inits.
chan envChan = [0] of {mtype};
chan servChan[NUM_NODES] = [1] of {mtype};

init {
  atomic {
    int i;
    for (i : 0  .. (NUM_NODES-1)) {
      run Node(servChan[i]);
    }
  }
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

// storage for conjunctive decision
bool data[3];

// not sure if needed but might be, testing later
data[0]=false;
data[1]=false;
data[2]=false;

// index for the storage
int index=0; 

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

Answering: // updating index will only be relevant here
        if
        :: servChan[j] ? smallData -> 
            data[index]=false;
            index=index+1; // index++
            servChan[j] ! continue; 
            goto Idle_Answering;
        :: servChan[j] ? bigData ->
            if 
            :: (data[0] || data[1] || data[2]) -> 
              servChan ! stop;
              goto Idle_Stopping;
            :: else -> 
              data[index]=true;
              index=index+1; // index++
            fi;

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
            servChan[j] ! stop; 
            goto Idle_Stopping;
        :: servChan[j] ? bigData ->
            servChan[j] ! stop;
            goto Idle_Stopping;
        fi;
}

proctype Node(chan out) {
Idle:   
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
