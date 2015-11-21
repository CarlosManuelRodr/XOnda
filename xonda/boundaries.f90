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
    if (BDR.eq.0) then
        psi(0) = Lmode(0)
        pi(0)  = Lmode(0)
    
        ! Frontera derecha
        psi(Nx) = - Rmode(Nx)
        pi(Nx)  = Rmode(Nx)
    else if (BDR.eq.1) then
        ! Condiciones reflejantes
        ! Frontera izq
        psi(0) = -psi(1)
        pi(0) = -pi(1)
    
        ! Frontera derecha
        psi(Nx) = -psi(Nx-1)
        pi(Nx) = -pi(Nx-1)
    else if (BDR.eq.2) then
        ! Periodicas
        psi(0) = psi(Nx-1)
        pi(0) = pi(Nx-1)
    
        psi(Nx) = psi(1)
        pi(Nx) = pi(1)
    else
        print *, 'Vales verga, este método no existe.'
    end if
    
end subroutine boundaries
