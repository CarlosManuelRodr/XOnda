
!!$ --------------------------------------------------
!!$ Authors :  Carlos Manuel Rodríguez Martinez
!!$
!!$ Version : 1.0 (18/11/2015)
!!$
!!$ Este programa resuelve la ecuacion de onda en 1D
!!$ --------------------------------------------------

program main

use global_numbers

implicit none ! Para quitar variables predeterminadas.

integer Nxx, Ntt
integer every_0Dt, every_1Dt

Namelist /ONDA_Input/ xmin, xmax, &
                     res_num, &
                     Nxx, courant, Ntt, &
                     every_0Dt, every_1Dt, &
                     amplitude, sigma, x0

open (3, file='iii.par', status = 'old')
read (3, nml = ONDA_Input)
close(3)

pii = 4.0d0*atan(1.0d0)

Nx = 2**(res_num-1)*Nxx
Nt = 2**(res_num-1)*Ntt
every_0D = 2**(res_num-1)*every_0Dt
every_1D = 2**(res_num-1)*every_1Dt

call cpu_time(cpu_it)
call evolve
call cpu_time(cpu_ft)

print *
print *, 'PROGRAM ONDA-UV HAS FINISHED'
print *, 'CPU time has been =', cpu_ft - cpu_it
print *

end program main
