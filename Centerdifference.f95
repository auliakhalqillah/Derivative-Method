! HOW TO COMPILE THROUGH COMMAND LINE (CMD OR TERMINAL)
! gfortran -c Centerdifference.f95
! gfortran -o Centerdifference Centerdifference.o
!
! The program is open source and this can be used to numerical study purpose.
! The program was written by Aulia Khalqillah,S.Si
!
! email: auliakhalqillah.mail@gmail.com
! ==============================================================================
PROGRAM CenterDifference
  IMPLICIT NONE

  REAL :: A,B,H,X,RAWF,F
  REAL,DIMENSION(1000) :: RAWFS,FA,FX,XS,RES

  INTEGER :: I,N
  CHARACTER(len=100) :: FMT

  WRITE(*,*)""
  WRITE(*,*)"----------------------------------------"
  WRITE(*,*)"CENTER DIFFERENCE METHOD - DERIVATIVE"
  WRITE(*,*)"----------------------------------------"
  WRITE(*,*) ""
  WRITE(*,"(a)",advance="no") "INSERT INITIAL BOUNDARY:"
  READ *, A
  WRITE(*,"(a)",advance="no") "INSERT FINAL BOUNDARY:"
  READ *, B
  WRITE(*,"(a)",advance="no") "INSERT DATA LENGTH:"
  READ *, N

  FMT = "(a12,a13,a20,a20,a15,a15)"
  WRITE(*,*) ""
  WRITE(*,FMT)"ITER","Data(X)","Raw F(X)","Difference F(X)","Analytic F(X)","RESIDUAL"
  OPEN(10, FILE ='CdiffOut.txt', STATUS='replace')

  ! Residual between two point is calculated
  H = (B-A)/N
  X = A
  I = 1
  DO WHILE (I .le. N)
    RAWF = F(X)
    RAWFS(I) = RAWF ! Save the value
    FX(I) = (F(X+H)-F(X-H))/(2*H) ! Center Difference is calculated
    XS(I) = X ! Save the value
    FA(I) = 2*XS(I)  ! Analytic Calculation of First Difference
    RES(I) = abs(real(FX(I))-real(FA(I))) ! Residual Calculation
    WRITE(*,*) I,XS(I),RAWFS(I),FX(I),FA(I),RES(I)
    WRITE(10,*) I,XS(I),RAWFS(I),FX(I),FA(I),RES(I)
    X = X + H
    I = I + 1
  END DO
END PROGRAM

REAL FUNCTION F(X)
  IMPLICIT NONE
  REAL :: X
  F = X**2
END FUNCTION
