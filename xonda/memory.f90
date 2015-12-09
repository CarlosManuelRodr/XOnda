
subroutine memory

use arrays
use global_numbers

implicit none

allocate(x(0:Nx))
allocate(phi(0:Nx), phi_p(0:Nx), rhs_phi(0:Nx), dphi(0:Nx))
allocate(psi(0:Nx), psi_p(0:Nx), rhs_psi(0:Nx), dpsi(0:Nx))
allocate(pi(0:Nx),  pi_p(0:Nx),  rhs_pi(0:Nx), dpi(0:Nx))
allocate(Lmode(0:Nx), Rmode(0:Nx))
allocate(phi_exacta(0:Nx), error(0:Nx))
allocate(alpha(0:Nx), dalpha(0:Nx))
allocate(beta(0:Nx), dbeta(0:Nx))
allocate(gamma(0:Nx), dgamma(0:Nx))
allocate(gamma_rr(0:Nx), dgamma_rr(0:Nx))
allocate(constriction(0:Nx))

end subroutine memory
