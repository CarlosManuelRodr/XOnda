subroutine calc_constriction
    
    use arrays
    use global_numbers

    implicit none
    
    integer i
    real(kind=8) idx
    
    ! Calcula la derivada de psi respecto a x para obtener la constricción.
    idx = 1.0d0 / dx
    do i=1, Nx-1
        dphi(i) = 0.5d0 * (phi(i+1) - phi(i-1)) * idx ! Derivada centrada.
    end do
    
    dphi(0)  = 0.5d0 * (-3.0d0 * phi(0) + 4.0d0 * phi(1) - phi(2)) * idx  ! Derivada upwind.
    dphi(Nx) = 0.5d0 * (3.0d0 * phi(Nx) - 4.0d0 * phi(Nx-1) + phi(Nx-2)) * idx  ! Derivada downwind.
    constriction = psi - dphi
    
end subroutine calc_constriction