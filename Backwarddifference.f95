! HOW TO COMPILE THROUGH COMMAND LINE (CMD OR TERMINAL)
! gfortran -c Backwarddifference.f95
! gfortran -o backwarddiff Backwarddifference.o
!
! The program is open source and can use to numeric study purpose.
! The program was build by Aulia Khalqillah,S.Si
!
! email: auliakhalqillah.mail@gmail.com
! ==============================================================================
PROGRAM BackwardDifference
IMPLICIT NONE

REAL :: A,B,H
REAL,DIMENSION(1000) :: F,FX,X

INTEGER :: I,N

WRITE(*,*) "INSERT INITIAL BOUNDARY:"
read *, A
WRITE(*,*) "INSERT FINAL BOUNDARY:"
read *, B
WRITE(*,*) "INSERT DATA LENGTH:"
read*, N

write(*,*) ""

OPEN(10, FILE ='BackwardOut.txt', STATUS='replace')
! Calculating residual between data point
H = (B-A)/N

! Calculating First Orde Backward Difference
X(1) = A
DO I = 1, N+1
  F(I) = X(I)**2
  X(I+1) = X(I) + H
END DO

DO I = 1,N
  FX(I) = (F(I)-F(I-1))/H
END DO

WRITE(*,*) "------------------------------------------------------"
WRITE(*,*) "First Column: Index Number"
WRITE(*,*) "Second Column: Data Series"
WRITE(*,*) "Third Column: Original Function Result"
WRITE(*,*) "Fourth Column: Backward Difference Function Result"
WRITE(*,*) "------------------------------------------------------"

DO I = 1,N
  WRITE(*,*) I,X(I),F(I),FX(I)
  WRITE(10,*) I,X(I),F(I),FX(I)
END DO

END PROGRAM
