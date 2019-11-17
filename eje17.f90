PROGRAM ascii2grads

REAL, ALLOCATABLE :: MASK(:,:)
INTEGER reclen

ix=48
ij=96
ALLOCATE (MASK(ix,ij))

OPEN(10, FILE='land_sea_mask.txt', STATUS='OLD')
DO I=1, ix
READ(10,*) MASK(I,:)
ENDDO

inquire(iolength=reclen) mask
print*, reclen

open (20,file='lsm_dir.grd', form='unformatted', access='direct', recl=reclen,status='unknown')

WRITE(20,rec=1) ((MASK(i,j),j=1,ij),i=1,ix)

END