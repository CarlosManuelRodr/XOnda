program main ! Empieza el programa.

    use global_numbers ! Numeros que usaremos en el codigo.

    implicit none ! Este paso es para quitar cosas predeterminadas por Fortran.

    integer Nxx, Ntt   ! El identificador integer Define enteros.
    integer every_0Dt, every_1Dt

    ! Parametros de entrada
    Namelist /ONDA_Input/ xmin, xmax, &
                         res_num, &
                         Nxx, courant, Ntt, &
                         every_0Dt, every_1Dt, &
                         amplitude, sigma, x0, BDR, MTR

    open (3, file='iii.par', status = 'old' ) ! Aqui se definen los valores de la lista anterior.
    read (3, nml = ONDA_Input)
    close(3)

    pii = 4.0d0*atan(1.0d0)

    ! res_num me define la resolucion.
    Nx = 2**(res_num-1)*Nxx ! Numero de puntos/divisiones/celdas de la malla.
    Nt = 2**(res_num-1)*Ntt 

    every_0D = 2**(res_num-1)*every_0Dt ! Cada cuanto quiero guardar datos/escalares.
    every_1D = 2**(res_num-1)*every_1Dt ! Cada cuanto guardo cantidades como f(x).

    call CPU_TIME(cpu_it) ! call -- llama a subrutinas dentro de la carpeta onda-uv.
    call evolve
    call CPU_TIME(cpu_ft)

    print * ! print -- sirve para mandar a pantalla alguna cantidad o texto.
    print *, 'PROGRAM ONDA-UV HAS FINISHED'
    print *, 'CPU time has been =', cpu_ft-cpu_it
    print *

end program main
