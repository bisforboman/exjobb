# Proofs for Models

This document will present the proofs for the models, current model being verified is: simple_model.pml

Meanings:
* []: always 
* <>: eventually \\
* ->: implies
* ^: and
* v: or
* X: next 
* -: not

*Correctness proof(draft):*

The property I seek to prove is: { [] (oC -> (X (<> dC))) && (<> dC) }

I will use the notation that *s65* means the server process and for line 65 in the model im verifying. (the letter is a bit redundant) Also *defAns* is not a boolean, but since it only has 2 values I will consider: 

*defAns = stop* as *true* and 
*defAns = continue* as *false*.

_Proof by contradiction_


~~~~
Assert { oC -> ([] (- dC)) } 

s64: bigData -> oC
s65: bigData -> defAns
n93: defAns -> <> dC

n93 ^ s64 ^ s65 gives: bigData -> oC -> <> dC

Contradiction.
~~~~

Explained in words:

Assertion: The system is overcollecting but will never stop collecting.

s64 and s65: If bigData is retrieved in the server then it's overcollecting and server will start responding accordingly.

n93: If defAns is true then the node sending will stop collecting upon hearing back from the server.
