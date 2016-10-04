mtype = {SEND, STOP};

chan ntoS = [0] of {int}; 
chan stoN = [0] of {mtype}; 
chan etoN = [0] of {int};
chan ntoE = [0] of {mtype};

chan ntoS2 = [0] of {int}; 
chan stoN2 = [0] of {mtype}; 
chan etoN2 = [0] of {int};
chan ntoE2 = [0] of {mtype};

bool serverToggle=true, environmentToggle=true;

proctype Environment(chan in, out, in2, out2) {
  int r=0; // r is the data from the environment
  int nodesDone=0;
  mtype msg; 
  printf("Environment starting up.\n");
  do 
  ::  do 
      :: r=7;  break;
      :: r=2;  break;
      :: r=1;  break;
      :: r=11; break;
      :: r=5;  break;
      od;

      if
      :: (nodesDone == 2) -> break;
      :: (environmentToggle == true) && (nodesDone < 2)-> 
          in ? msg;

          if 
          :: msg == SEND -> out ! r;
          :: else        -> 
            nodesDone = nodesDone+1;
            environmentToggle = !environmentToggle;
          fi;
          
          if
          :: nodesDone == 0 -> environmentToggle = !environmentToggle;
          :: else
          fi;

      :: (environmentToggle == false) && (nodesDone < 2)->
          in2 ? msg;

          if 
          :: msg == SEND -> out2 ! r;
          :: else        -> 
            nodesDone = nodesDone+1;
            environmentToggle = !environmentToggle;
          fi;

          if
          :: nodesDone == 0 -> environmentToggle = !environmentToggle;
          :: else
          fi;
      :: else
      fi;
  od;

  printf("Environment done, shutting down.\n");
}

/* inS = incoming from server
   outS = output to server
*/
proctype Node(chan inS, outS, inE, outE) {
  int data;
  int c=0;
  mtype dec;

  printf("Node %d starting up\n", _pid);

  do 
    :: outE ! SEND; // request info from environment
       inE ? data -> 
         outS ! data;
         inS ? dec -> 
         if
         :: dec == STOP -> outE ! STOP; break;
         :: else
         fi;
         c++;
  od;
  printf("Node %d done, shutting down. Did this %d times.\n", _pid, c);
}


proctype Server(chan in, out, in2, out2) {
  int data;
  int nodesDone = 0;
  printf("Server starting up.\n");
  do 
    :: (nodesDone == 2) -> 
        break;
    :: (serverToggle==true) && (nodesDone < 2) -> 
        in ? data ->
        printf("Number received from node 1: %d\n", data);
        if 
        :: (data > 10) -> 
            out ! STOP;  
            nodesDone=nodesDone+1;
            serverToggle = !serverToggle;
        :: else -> 
            out ! SEND; 
            if 
            :: nodesDone == 0 -> serverToggle = !serverToggle;
            :: else
            fi;
        fi;
    :: (serverToggle==false) && (nodesDone < 2) -> 
        in2 ? data ->
        printf("Number received from node 2: %d\n", data);
        if 
        :: (data > 10) -> 
            out2 ! STOP;  
            nodesDone = nodesDone+1;
            serverToggle = !serverToggle;
        :: else -> 
            out2 ! SEND;
            if 
            :: nodesDone == 0 -> serverToggle = !serverToggle;
            :: else
            fi;
        fi;
  od;
  printf("Server done, shutting down.\n");
} 

init {
  run Server(ntoS, stoN, ntoS2, stoN2);
  run Node(stoN2, ntoS2, etoN2, ntoE2);
  run Node(stoN, ntoS, etoN, ntoE);
  run Environment(ntoE, etoN, ntoE2, etoN2);
}