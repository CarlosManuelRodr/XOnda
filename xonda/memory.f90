
subroutine memory

use arrays
use global_numbers

implicit none

allocate(x(0:Nx))
allocate(phi(0:Nx), phi_p(0:Nx), rhs_phi(0:Nx))
allocate(psi(0:Nx), psi_p(0:Nx), rhs_psi(0:Nx), dpsi(0:Nx))
allocate(pi(0:Nx),  pi_p(0:Nx),  rhs_pi(0:Nx), dpi(0:Nx))

end subroutine memory
