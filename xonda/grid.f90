subroutine grid

    use arrays
    use global_numbers

    implicit none

    integer i

    dx = (xmax - xmin) / dble(Nx) ! El paso en el espacio.

    do i=0, Nx
        x(i) = xmin + dble(i) * dx
    end do
    
    dt = courant * dx ! El paso en el tiempo,cuidando que las
                      ! señales numéricas no se propaguen.
    
    print *, '============  Parametros  ==============='
    print *, 'xmin = ', xmin
    print *, 'xmax = ', xmax
    print *, 'Nx = ', Nx
    print *, 'Nt = ', Nt
    print *, 'Courant = ', courant
    print *, 'Amplitude = ', Amplitude
    print *, 'x0 = ', x0
    print *, 'Sigma = ', sigma
    print *, 'dx = ', dx
    print *, 'dt = ', dt
    print *, '=========================================='

end subroutine grid
