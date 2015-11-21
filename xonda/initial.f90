subroutine  initial

    use arrays ! Use para llamar módulos. Call para subrutinas.
    use global_numbers
    implicit none
    
    ! Derivadas de la metrica de Schwarzschild
    alpha = 1.0d0 / sqrt(1.0d0 + 2.0d0 / x)
    beta = 2.0d0 / (x * (1.0d0 + 2.0d0 / x))
    dalpha = 1.0d0 / (x**2 * (1.0d0 + 2.0d0 / x)**(3.0d0/2.0d0))
    dbeta = -2.0d0 / (2.0d0 + x)**2.0d0
    gamma = sqrt(x**4 * (1.0d0 + 2.0d0 / x))
    gamma_rr = 1.0d0 + 2.0d0 / x
    dgamma = (x**2 * (3.0d0 + 2.0d0 * x)) / sqrt(x**3 * (2.0d0 + x))
    dgamma_rr = - 2.0d0 / x**2

    phi = amplitude * exp(-(x-x0)**2 / sigma**2)
    psi = -2.0d0 * phi * ((x-x0) / sigma**2)
    pi = 0.0d0

end subroutine initial
