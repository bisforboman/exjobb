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
ltl toNotCollect { msgSent implies eventually dC } 

/* 

  Liveness property 

  * States the program should keep collecting until the decision is sent.

  */
//ltl keepCollecting { !dC W msgSent }

chan msg = [0] of {mtype};

active proctype Process() {
Idle: msg ! request;
      do
      :: msg ? request -> 
          do 
          :: msg ! smallData; break;
          :: msg ! bigData; break;
          od;
      :: msg ? smallData -> msg ! continue;
      :: msg ? bigData -> msg ! stop; 
                          msgSent = true;
      :: msg ? continue -> msg ! request;
      :: msg ? stop -> break;
      od;
      dC = true;
}


