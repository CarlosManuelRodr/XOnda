module global_numbers

    real(kind=8) pii
    real(kind=8) xmin, xmax, dx, courant, t, dt
    real(kind=8) amplitude, sigma, x0

    integer res_num ! Define la resolucion.
    integer Nx, Nt  ! Nmero de puntos de la malla (celdas).
    integer every_0D, every_1D ! 0D: Cada cuanto quiero guardar datos/escalares.
                               ! 1D: Listas.
    integer BDR  ! Condicion de frontera.
    integer MTR  ! Tipo de metrica.
 
    real(kind=8) cpu_it,cpu_ft,cpu_t

end module global_numbers
