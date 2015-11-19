subroutine boundaries
    use arrays
    use global_numbers
    
    implicit none
    
    ! Calcular modos R, L
    Rmode = 0.5d0 * (pi - psi)
    Lmode = 0.5d0 * (pi + psi)
    
end subroutine boundaries