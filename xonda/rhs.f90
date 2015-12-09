subroutine rhs
 
    use arrays
    use global_numbers 
    implicit none

    integer i
    real(kind=8) idx

    idx=1.0d0/dx ! Ahorra tiempo y memoria a la maquina/eficiencia.

    ! Derivadas a segundo orden de psi y pi.
    do i=1, Nx-1
        dpsi(i) =  0.5d0*(psi(i+1) - psi(i-1))*idx  ! Derivada centrada.
    end do

    ! Derivada upwind.
    dpsi(0) = 0.5d0*(-3.0d0*psi(0) + 4.0d0*psi(1) - psi(2))*idx 
    ! Derivada downwind.
    dpsi(Nx) = 0.5d0*(3.0d0*psi(Nx) - 4.0d0*psi(Nx-1) + psi(Nx-2))*idx 

    do i=1, Nx-1
        dpi(i) = 0.5d0*(pi(i+1) - pi(i-1))*idx
    end do

    dpi(0) = 0.5d0*(-3.0d0*pi(0) + 4.0d0*pi(1) - pi(2))*idx
    dpi(Nx) = 0.5d0*(3.0d0*pi(Nx) - 4.0d0*pi(Nx-1) + pi(Nx-2))*idx

    ! RHS de las funciones phi, psi, pi.
    if(MTR.eq.0)then
        ! RHS metrica de Minkowski.
        rhs_phi = pi
        rhs_psi = dpi
        rhs_pi  = dpsi 

    else if(MTR.eq.1) then
        ! RHS metrica de Schwarzschild.
        rhs_phi = alpha*pi + beta*psi
        rhs_psi = alpha*dpi + dalpha*pi + beta*dpsi + dbeta*psi
        rhs_pi  = dgamma*(beta*pi + alpha*gamma_rr*psi)/gamma &
                + beta*dpi + dbeta*pi + dalpha*gamma_rr*dpsi &
                + alpha*dgamma_rr*psi + alpha*gamma_rr*dpsi

    else
        print*,'No hay otra mtrica programada'
    end if

end subroutine rhs
