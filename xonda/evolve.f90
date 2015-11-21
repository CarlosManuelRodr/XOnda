subroutine evolve
    
    use arrays
    use global_numbers

    implicit none
    integer l

    call memory
    call grid
    
    t = 0
    phi_p = 0.0d0
    psi_p = 0.0d0
    pi_p  = 0.0d0
    
    print *, '----------------------------'
    print *, '|  Time step  |    Time    |'
    print *, '----------------------------'
    write (*, "(A5,I6,A6,ES9.2,A3)") ' |   ', 0, '   | ', t, '|'
    
    call initial
    call exacta
    call save1D(phi, 'phi', 0)
    call save1D(psi, 'psi', 0)
    call save1D(pi, 'pi', 0)
    call save1D(phi_exacta, 'phi_exacta', 0)
    call save1D(error, 'error', 0)
    call save0D(error, 'error', 0)
    
    do l=1, Nt ! t^n, este loop agregará bloques de datos al archivo de salida.
        
        ! Aquí se define el tiempo de la evolución.
        t = t + dt
        
        if (mod(l, every_1D).eq.0) then
            write(*, "(A5,I6,A6,ES9.2,A3)") ' |   ', l, ' | ', t, '|'
        end if
        
        call RK3
        call exacta
        
        if (mod(l, every_0D).eq.0) then
            call save0D(error, 'error', 1)
        end if
    
        if (mod(l, every_1D).eq.0) then
            call save1D(phi, 'phi', 1)
            call save1D(psi, 'psi', 1)
            call save1D(pi, 'pi', 1)
            call save1D(phi_exacta, 'phi_exacta', 1)
            call save1D(error, 'error', 1)
        end if
        
    end do
    print *, '----------------------------'

end subroutine evolve
