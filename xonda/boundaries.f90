subroutine boundaries
    use arrays
    use global_numbers
    
    implicit none
    
    ! Calcular modos R, L
    Rmode = 0.5d0 * (pi - psi)
    Lmode = 0.5d0 * (pi + psi)
    
    ! Extrapolacion de segundo orden.
    Rmode(0) = 3.0d0 * Rmode(1) - 3.0d0 * Rmode(2) + Rmode(3)
    Lmode(0) = 3.0d0 * Lmode(1) - 3.0d0 * Lmode(2) + Lmode(3)
    
    Rmode(Nx) = 3.0d0 * Rmode(Nx-1) - 3.0d0 * Rmode(Nx-2) + Rmode(Nx-3)
    Lmode(Nx) = 3.0d0 * Lmode(Nx-1) - 3.0d0 * Lmode(Nx-2) + Lmode(Nx-3)
    
    ! Condiciones de onda saliente
    ! Frontera izq
    psi(0) = Lmode(0)
    pi(0)  = Lmode(0)
    
    ! Frontera derecha
    psi(Nx) = - Rmode(Nx)
    pi(Nx)  = Rmode(Nx)
    
end subroutine boundaries