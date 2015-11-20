subroutine rhs

    use arrays
    use global_numbers
    
    implicit none
    
    integer i
    real(kind=8) idx
    
    ! Derivadas a segundo orden de pi y psi.
    idx = 1.0d0 / dx
    
    do i=1, Nx-1
        dpsi(i) = 0.5d0 * (psi(i+1) - psi(i-1)) * idx ! Derivada centrada.
    end do
    
    dpsi(0)  = 0.5d0 * (-3.0d0 * psi(0) + 4.0d0 * psi(1) - psi(2)) * idx  ! Derivada upwind.
    dpsi(Nx) = 0.5d0 * (3.0d0 * psi(Nx) - 4.0d0 * psi(Nx-1) + psi(Nx-2)) * idx  ! Derivada downwind.
    
    do i=1, Nx-1
        dpi(i)  = 0.5d0 * (pi(i+1) - pi(i-1)) * idx
    end do
    
    dpi(0)  = 0.5d0 * (-3.0d0 * pi(0) + 4.0d0 * pi(1) - pi(2)) * idx
    dpi(Nx) = 0.5d0 * (3.0d0 * pi(Nx) - 4.0d0 * pi(Nx-1) + pi(Nx-2)) * idx
    
    ! RHS de las funciones phi, psi, pi.
    rhs_phi = pi
    rhs_psi = dpi
    rhs_pi = dpsi
    
end subroutine rhs
