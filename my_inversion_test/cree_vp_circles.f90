program cree_vp_circles

! created by Jiaze He 
! 

! revised on Mon Nov 26 16:47:16 UTC 2018
! modify the masking generating by change it to 1- cos(2*pi*(outer_cut -
! r(x,z))/T), where T = 2* (outer_cut - inner_cut)


  implicit none

  ! local parameters
  integer :: i,j,ispec,iproc,nspec,NGLL,NPROC,filesize 
  real, dimension (:,:), allocatable :: position_cercle
  real:: x, z, tol,amax,size_layer,mypi,mf_one_ring,Thold
  real:: x_center,y_center,radius_circle,T_space,phy,Dxy,Dxy2,mf_multi_rings
  real:: x_center2,y_center2,radius_circle2
  real:: x_center_big,y_center_big,radius_circle_big
  LOGICAL :: mf_range,mf_range2,mf_range_big
  real, dimension(:,:,:), allocatable :: x_store,z_store,vp_store
  character(len=200) :: filename
  nspec=300*300/1
  tol = 0.3
  amax=0.04
  size_layer = tol*amax
  NGLL=5
  NPROC=8


  do iproc=1,NPROC
  !open a file to estimate the filesize
  write(filename,'(a,i6.6,a)') './model_init/proc',iproc-1,'_x.bin'
  open(unit=13,file=filename,status='old',form='unformatted')
  inquire(13,size=filesize) 
  close(13)
  !there are 8 bits of size is not due to SEMs, the size of element is 4
  !(floatsize*NGLL*NGLL)
  nspec = (filesize-8)/(4*NGLL*NGLL)
  print *,'nspec:',nspec  

 ! On remplit ce tableau avec x,z
  allocate(x_store(NGLL,NGLL,nspec))
  allocate(z_store(NGLL,NGLL,nspec))
  allocate(vp_store(NGLL,NGLL,nspec))

  write(filename,'(a,i6.6,a)') './model_create/proc',iproc-1,'_x.bin'
  open(unit=13,file=filename,status='old',form='unformatted')
  write(filename,'(a,i6.6,a)') './model_create/proc',iproc-1,'_z.bin'
  open(unit=14,file=filename,status='old',form='unformatted')
  write(filename,'(a,i6.6,a)') './model_create/proc',iproc-1,'_vp.bin'
  open(unit=154,file=filename,status='unknown',form='unformatted')


  read(13) x_store
  read(14) z_store
  close(13)
  close(14)

!! for four bc linear array's masking
  !do ispec=1,nspec
  !  do j=1,NGLL
  !    do i=1,NGLL
  !     x = x_store(i,j,ispec)
  !     z = z_store(i,j,ispec)
  !     if ( x< size_layer .or. z < size_layer .or. x > amax - size_layer .or. z > amax - size_layer ) then
  !      vp_store(i,j,ispec) = 0.0
  !     else if ( x< 2*size_layer .and. z > x .and. ((amax - x) > z) ) then
  !      vp_store(i,j,ispec) = sin( 3.1415926535/2 * (x - size_layer)/size_layer  )  
  !     else if ( z< 2*size_layer  .and. ((amax - x) > z )) then
  !      vp_store(i,j,ispec) = sin( 3.1415926535/2 * (z - size_layer)/size_layer  )         
  !     else if ( x > amax - 2*size_layer .and. z<x) then
  !      vp_store(i,j,ispec) = sin( 3.1415926535/2 * (amax - size_layer - x)/ size_layer  )  
  !     else if ( z > amax - 2*size_layer) then
  !      vp_store(i,j,ispec) = sin( 3.1415926535/2 * (amax - size_layer - z)/ size_layer  ) 
  !     else
  !      vp_store(i,j,ispec) = 1.0
  !     endif
  !    enddo
  !  enddo
  !enddo

x_center = 0 
y_center = 0.025
x_center2 = 0
y_center2 = -0.025
x_center_big = 0
y_center_big = 0 

! array radius - change to transition center
radius_circle = 0.010
radius_circle2 = 0.010
radius_circle_big = 0.047



! to adjust such that at radius = radius_circle, the total phase is 2*pi
mypi = 3.1415926535

! radius inside zero
!!Dxy = radius_circle - T_space/2;
! radius outside zero
!Dxy2 = radius_circle + T_space/2; 

print *, 'x_center',x_center

print *, 'phy', phy

Thold = 0.5

do ispec=1,nspec
    do j=1,NGLL
      do i=1,NGLL
       x = x_store(i,j,ispec)
       z = z_store(i,j,ispec)
       !mf_multi_rings = 1/2*(1+cos(2*pi*SQRT((x-x_center)^2+(y-y_center)^2)/T_space + phy))
       mf_range = (SQRT((x-x_center)**2 + (z-y_center)**2) < (radius_circle + 1E-012)) 
       mf_range2 = (SQRT((x-x_center2)**2 + (z-y_center2)**2) < (radius_circle2 + 1E-012)) 
       mf_range_big  = (SQRT((x-x_center_big)**2 + (z-y_center_big)**2) < (radius_circle_big + 1E-012)) 
       if (mf_range_big) then
           if (mf_range) then
               vp_store(i,j,ispec) = 1479.7
           else if (mf_range2) then 
               vp_store(i,j,ispec) = 1520.0
           else 
               vp_store(i,j,ispec) = 1500.0
           end if
       else 
           vp_store(i,j,ispec) = 1479.7
       end if

      enddo
    enddo
  enddo


  write(154) vp_store
  close(154)

  deallocate(x_store,z_store,vp_store)

  enddo

end program cree_vp_circles
