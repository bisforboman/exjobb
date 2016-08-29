#define N   3

mtype = {ack, stop, collect, send};
int nodesDone=0;

chan ntoS = [2] of {mtype, int, int}; 
chan stoN = [2] of {mtype, int}; 
chan etoN = [2] of {mtype, int, int};
chan ntoE = [2] of {mtype, int};

// watchers
bool dC = false; // doneCollecting
bool msgSent = false; // stopcollection message sent. 

// ltl formula
ltl toNotCollect { msgSent implies eventually dC }

proctype Environment(chan in, out) {
  int r=0; // r is the data from the environment
  int id;  
  printf("Environment starting up.\n");
  do 
  :: (nodesDone == N) -> 
     break;
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

     in ? collect(id);

     out ! ack(id, r);

  od;
  printf("Environment done, shutting down.\n");
}

/* inS = incoming from server
   outS = output to server
*/
proctype Node(chan inS, outS, inE, outE) {
  int data;
  int id=_pid;
  mtype msg;
  int c = 1;

  printf("Node %d starting up.\n", id);

  do 
  :: outE ! collect(id); // request info from environment
     inE ? ack(id, data); // receive - || - 
     outS ! send(id, data);
     inS ? msg,id;
     if 
     :: (msg == stop) -> break;
     :: (msg == ack) ->  c=c+1;
     :: else -> 
     fi;
  od;

  nodesDone = nodesDone+1; 
  printf("Node %d done, shutting down. Did this %d times.\n", id, c);
}


proctype Server(chan in, out) {
  int data;
  int id;
  printf("Server starting up.\n");
  do 
    :: (nodesDone == N) -> 
        break;
    :: (nodesDone<N) && (nempty(in)) -> 
        in ? send(id, data); 
        if 
        :: (data > 9) -> 
            out ! stop(id);
        :: else ->
            out ! ack(id);
        fi;
        printf("Collected %d from Node %d.\n", data, id);
  od;
  printf("Server done, shutting down.\n");
} 

init {
  run Server(ntoS, stoN);
  run Node(stoN, ntoS, etoN, ntoE);
  run Node(stoN, ntoS, etoN, ntoE);
  run Node(stoN, ntoS, etoN, ntoE);
  run Environment(ntoE, etoN);
}