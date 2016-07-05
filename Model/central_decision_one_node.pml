mtype = {SEND, STOP};

chan ntoS = [0] of {int}; 
chan stoN = [0] of {mtype}; 
chan etoN = [0] of {int};
chan ntoE = [0] of {mtype};

proctype Environment(chan in, out) {
  int r=0; // r is the data from the environment
  mtype msg;  
  do 
  ::  do 
      :: r=7; break;
      :: r=2; break;
      :: r=1; break;
      :: r=11; break;
      :: r=5; break;
      od

      in ? msg;

      if 
      :: msg == SEND -> out ! r;
      :: else        -> break;
      fi;
  od;
  printf("Environment done, shutting down.\n");
}

/* inS = incoming from server
   outS = output to server
*/
proctype Node(chan inS, outS, inE, outE) {
  int data;
  mtype dec;
  do 
    :: // request info from environment
       outE ! SEND; 
       inE ? data -> 
         outS ! data;
         inS ? dec -> 
           if
           :: dec == STOP -> outE ! STOP; break;
           :: else
           fi;

  od;
  printf("Node done, shutting down.\n");
}

proctype Server(chan in, out) {
  int data;
  do 
    :: in ? data ->
       printf("Number received: %d\n", data);
       if 
       :: (data > 10) -> out ! STOP; break;
       :: else        -> out ! SEND;
       fi;
  od;
  printf("Server done, shutting down.\n");
} 

init {
  run Server(ntoS, stoN);
  run Node(stoN, ntoS, etoN, ntoE);
  run Environment(ntoE, etoN);
}