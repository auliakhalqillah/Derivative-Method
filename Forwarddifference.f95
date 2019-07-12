! HOW TO COMPILE THROUGH COMMAND LINE (CMD OR TERMINAL)
! gfortran -c Backwarddifference.f95
! gfortran -o backwarddiff Backwarddiference.o
!
! The program is open source and can use to numeric study purpose.
! The program was build by Aulia Khalqillah,S.Si
!
! email: auliakhalqillah.mail@gmail.com
! ==============================================================================
PROGRAM ForwardDifference
IMPLICIT NONE

REAL :: A,B,H
REAL,DIMENSION(1000) :: F,FX,X

INTEGER :: I,N
CHARACTER(len=100) :: FMT

WRITE(*,*)""
WRITE(*,*)"----------------------------------------"
WRITE(*,*)"FORWARD DIFFERENCE METHOD - DERIVATIVE"
WRITE(*,*)"----------------------------------------"
WRITE(*,*) ""
WRITE(*,"(a)",advance="no") "INSERT INITIAL BOUNDARY:"
READ *, A
WRITE(*,"(a)",advance="no") "INSERT FINAL BOUNDARY:"
READ *, B
WRITE(*,"(a)",advance="no") "INSERT DATA LENGTH:"
READ *, N

FMT = "(a12,a13,a20,a20)"
WRITE(*,*) ""
WRITE(*,FMT)"ITER","Data(X)","Analytic F(X)","Integration F(X)"
OPEN(10, FILE ='ForwardOut.txt', STATUS='replace')
! Calculating residual between data point
H = (B-A)/N

! Calculating First Orde Forward Difference
X(1) = A
DO I = 1, N+1
  F(I) = X(I)**2
  X(I+1) = X(I) + H
END DO

DO I = 1,N
  FX(I) = (F(I+1) - F(I))/H
END DO

DO I = 1,N
  WRITE(*,*) I,X(I),F(I),FX(I)
  WRITE(10,*) I,X(I),F(I),FX(I)
END DO

END PROGRAM
