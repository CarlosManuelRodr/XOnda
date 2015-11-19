subroutine RK3
    use arrays
    use global_numbers
    
    implicit none
    integer k
    real(kind=8) dt_temp
    
    ! Guardandoelvalor det^n de las variables
    phi_p = phi
    psi_p = psi
    pi_p  = pi
    
    ! Runge-Kutta
    do k=1, 3
        call rhs
        if (k.eq.1) then
            dt_temp = dt
            phi = phi_p + dt_temp * rhs_phi
            psi = psi_p + dt_temp * rhs_psi
            pi  = pi_p  + dt_temp * rhs_pi
        else if (k.eq.2) then
            dt_temp = 0.25d0 * dt
            phi = 0.75d0 * phi_p + 0.25d0 * phi + dt_temp * rhs_phi
            psi = 0.75d0 * psi_p + 0.25d0 * psi + dt_temp * rhs_psi
            pi  = 0.75d0 * pi_p  + 0.25d0 * pi  + dt_temp * rhs_pi
        else
            dt_temp = 2.0d0 * dt / 3.0d0
            phi = phi_p / 3.0d0 + 2.0d0 * phi / 3.0d0 + dt_temp * rhs_phi
            psi = psi_p / 3.0d0 + 2.0d0 * psi / 3.0d0 + dt_temp * rhs_psi
            pi  = pi_p  / 3.0d0 + 2.0d0 * pi  / 3.0d0 + dt_temp * rhs_pi
        end if
    end do
    
    call boundaries
    
end subroutine RK3