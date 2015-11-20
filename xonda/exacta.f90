subroutine exacta
    
    use arrays
    use global_numbers
    
    implicit none
    
    phi_exacta = 0.50d0 * amplitude * exp(-(x-x0 + t)**2 / sigma**2) + 0.50d0 * amplitude * exp(-(x-x0 - t)**2 / sigma**2)
    error = phi_exacta - phi
    
end subroutine exacta