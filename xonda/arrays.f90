! Para definir las variables y arreglos.

module arrays

implicit none

real(kind=8), allocatable, dimension (:) :: x    ! 1D
real(kind=8), allocatable, dimension (:) :: phi, phi_p, rhs_phi
real(kind=8), allocatable, dimension (:) :: psi, psi_p, rhs_psi, dpsi
real(kind=8), allocatable, dimension (:) :: pi, pi_p, rhs_pi, dpi
real(kind=8), allocatable, dimension (:) :: Lmode, Rmode
real(kind=8), allocatable, dimension (:) :: phi_exacta, error
real(kind=8), allocatable, dimension (:) :: alpha, dalpha
real(kind=8), allocatable, dimension (:) :: beta, dbeta
real(kind=8), allocatable, dimension (:) :: gamma, dgamma
real(kind=8), allocatable, dimension (:) :: gamma_rr, dgamma_rr

!real(kind=8), allocatable, dimension (:,:) :: u  ! 2D (matriz Nx, Nt)

end module arrays
