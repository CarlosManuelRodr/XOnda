subroutine  initial

    use arrays ! Use para llamar módulos. Call para subrutinas.
    use global_numbers
    implicit none

    phi = amplitude * exp(-(x-x0)**2 / sigma**2)
    psi = -2.0d0 * phi * ((x-x0) / sigma**2)
    pi = 0.0d0

end subroutine initial
