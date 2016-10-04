#define N   3

/* There's still some flow in this file that isn't correct. Needs some rework. */

mtype = {ack, stop, collect, send};
int nodesDone=0;

// watchers
bool dC = false; // doneCollecting
bool msgSent = false; // stopcollection message sent. 

// ltl formula
ltl toNotCollect { msgSent implies eventually dC }

// channel inits.
chan ntoS = [N] of {int, mtype, int}; 
chan stoN = [N] of {int, mtype}; 
chan etoN = [N] of {int, mtype, int};
chan ntoE = [N] of {int, mtype};


// from where data is collected
proctype Environment(chan in, out) {
  int r=0; // r is the data from the environment
  int id;  
  printf("E: starting up.\n");
  do 
  :: (nodesDone == N) -> 
//     break;
  :: (nodesDone<N) && (nempty(in)) -> 
     do 
     :: r=1;  break;
     :: r=2;  break;
     :: r=3;  break;
     :: r=4;  break;
     :: r=5;  break;
     :: r=6;  break;
     :: r=7;  break;
     :: r=8;  break;
     :: r=9;  break;
     :: r=10; break;
     :: r=11; break;
     od;

     in ? id, collect;

     out ! id, ack, r;

  od;
  printf("E: Done, shutting down.\n");
}

/* 
   The characteristics of a collection node. Below are 
   translations of the parameters from the initialization.

   inS = stoN
   outS = ntoS
   inE = etoN
   outE = ntoE
*/
proctype Node(chan inS, outS, inE, outE) {
  int data;
  int id=_pid;
  mtype msg;
  int c = 1;

  printf("N%d: starting up.\n", id);

  do 
  :: outE ! id,collect; // request info from environment
     inE ? id, ack, data; // receive - || - 
     if 
     :: (data > 9) -> 
         outS ! id, stop, data;
         msgSent = true;
         nodesDone=nodesDone+1;
     :: else ->
         outS ! id, send, data;
     fi;
     inS ? id, msg;
     if 
//     :: (msg == stop) -> break; 
     :: (msg == ack) ->  c=c+1;
     :: else 
     fi;
  od;
  printf("N%d: Done, shutting down.\n", id); 
}

// The server storing the data.
proctype Server(chan in, out) {
  int data;
  int id;
  mtype defmsg = ack;
  mtype msg;
  printf("S: Starting up.\n");
  do 
    :: (nodesDone == N) -> // There can be messages still in the buffer. If all nodes are dead there's no point.
        dC = true;
    :: (nodesDone < N) && (nempty(in)) -> 
        in ? id, msg, data; 
        printf("S: Collected %d from Node %d.\n", data, id);
        if 
        :: msg == stop -> 
            defmsg = stop; 
        :: else 
        fi;
        out ! id, defmsg;
  od;
  printf("S: Done, shutting down.\n");
} 

init {
  run Server(ntoS, stoN);
  run Node(stoN, ntoS, etoN, ntoE);
  run Node(stoN, ntoS, etoN, ntoE);
  run Node(stoN, ntoS, etoN, ntoE);
  run Environment(ntoE, etoN);
}