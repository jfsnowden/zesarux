\ Division a/b with n decimal places using integer arithmetic.
\
\ Algorithm:
\ ________________
\
\ x = a/b
\ a = a - b*x
\ print x.
\ loop from 1 to n:
\	a = 10*a
\	x = a/b
\	a = a - b*x
\	print x
\ end loop
\ _________________

\ AceForth Implementation:

( Usage example:                          )
( Divide 22 by 7 with 20 digits precision )
( 22 7 20 /N                              )
( Avoid negative numbers or numbers with  )
( more then 3 digits                      )

: TASK ;

: BS  ( backspace )
  8 EMIT
;

: X  ( b a -- b a' x , x=a/b and a'=a-b*x )
  OVER OVER OVER              ( b a b a b )
  /                             ( b a b x )
  DUP >R                        ( b a b x )
  * - R>                         ( b a' x )
;

: /N                           ( a b n -- )
  CR
  SWAP ROT                        ( n b a )
  X . BS             ( print integer part )
  ASCII . EMIT        ( decimal separator )
  ROT 0                         ( b a n 0 )
  DO          ( print n fractional digits )
    10 *                           ( 10*a )
    X ASCII 0 + EMIT    ( print one digit )
  LOOP
  DROP DROP CR
;
 