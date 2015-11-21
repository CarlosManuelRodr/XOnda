subroutine save0D(zval,base_name,first_index)
  !  En esta subrutina se calculan la norma infinita, L1 y L2

  use arrays
  use global_numbers

  implicit none

  character(len=20) filestatus
  logical firstcall
  data firstcall / .true. /
  save firstcall

  character(len=*), intent(IN) :: base_name
  real(kind=8), dimension(0:Nx), intent(IN) :: zval

  character(len=256) :: filename

  integer i, j, k, first_index
  real(kind=8) min, max, nm1, nm2


  if (res_num.eq.1) then
    filename = base_name // '_1.tl'
  else if (res_num.eq.2) then
    filename = base_name // '_2.tl'
  else if (res_num.eq.3) then
    filename = base_name // '_3.tl'
  else if (res_num.eq.4) then
    filename = base_name // '_4.tl'
  else if (res_num.eq.5) then
    filename = base_name // '_5.tl'
  end if

  ! --->  El max(|F|) es la norma infinita
  max = zval(0)
  min = zval(0)
  nm1 = 0.0D0
  nm2 = 0.0D0

  do i=1, Nx
     if (zval(i) > max) max = zval(i)
     if (zval(i) < min) min = zval(i)
  end do

  do i=0, Nx-1
     ! Norma L1:|F|_1= integral(|F|)dx de  a-b
     nm1 = nm1 + 0.5d0 * ( dabs(zval(i))    + dabs(zval(i+1)) ) * dx

     ! Norma L2:|F|_1= sqrt[ integral(|F|**2)dx de  a-b ]
     nm2 = nm2 + 0.5d0 * ( zval(i)**2     + zval(i+1)**2 ) * dx

     if (zval(i) > max) max = zval(i)
     if (zval(i) < min) min = zval(i)
  end do

  nm2 = dsqrt(nm2)


  if (first_index.eq.0) then
     filestatus = 'replace'
  else
     filestatus = 'old'
  end if

    ! --->   Saving data   <---
  if (filestatus=='replace') then
     open(1, file=filename, form='formatted', status=filestatus)
  write(1, *) '#Time           maximum         minimum         nm1         nm2'
  else
     open(1, file=filename, form='formatted', status=filestatus, position='append')
  end if
     write(1, "(5ES14.6)") t, max, min, nm1, nm2
  close(1)

end subroutine save0D
