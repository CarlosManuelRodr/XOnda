
subroutine save1D(fval,base_name,first_index)

use arrays
use global_numbers

implicit none

character(len=20) filestatus ! character = char
logical firstcall ! bool
data firstcall / .true. / ! Guarda los datos en tiempos anteriores.
save firstcall

character(len=*), intent(IN) :: base_name ! Variable de entrada, es el nombre de salida que
                                          ! le asignamos a cada variable.
real(kind=8), dimension(0:Nx), intent(IN) :: fval ! Es la variable que quiero guardar. Los
                                                  ! que definimos en arrays.

character(len=256) :: filename

integer i,first_index

if (res_num.eq.1) then
filename = base_name // '_1.x' ! El nombre de salida + el subíndice que indica la resolución.
else if (res_num.eq.2) then
filename = base_name // '_2.x'
else if (res_num.eq.3) then
filename = base_name // '_3.x'
else if (res_num.eq.4) then
filename = base_name // '_4.x'
else if (res_num.eq.5) then
filename = base_name // '_5.x'
end if

if (first_index.eq.0) then
filestatus = 'replace' ! Aquí se borra el archivo exitente y se comienza a construir uno nuevo
                       ! desde cero.
else
filestatus = 'old'     ! Agrega bloques de datos en tiempos t^(n+1).
end if

! Abre el archivo de salida.
! 1 es el "handle" del ardhivo. Asterisco escribe la variable con todos los decimales.
if (filestatus=='replace') then
open(1,file=filename,form='formatted',status=filestatus)
else
open(1,file=filename,form='formatted',status=filestatus,position='append')
end if
! Esto es lo que va a guardar la subrutina.
write(1,*) ''
write(1,*) '#Time = ',t
do i=0,Nx,2**(res_num-1)
write(1,*) x(i),fval(i)
end do 
write(1,*)
close(1)

end subroutine save1D
