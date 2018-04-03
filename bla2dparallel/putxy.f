c ***********************************************************************
c
c $HeadURL: https://www.mech.kth.se/svn/simson/branches/bla2dparallel/putxy.f $
c $LastChangedDate: 2007-10-29 14:23:13 +0100 (Mon, 29 Oct 2007) $
c $LastChangedBy: qiang@MECH.KTH.SE $
c $LastChangedRevision: 786 $
c
c ***********************************************************************
      subroutine putxy(boxr,boxi,zb,i,ur,ui)
c
c     Put an xy box to ur  in core 
c     size of xy box:  memnx * mbz * nyp (real and imaginary part)
c      
      implicit none
      
      include 'par.f'

      integer zb,i
      real boxr(memnx,mbz,nyp),boxi(memnx,mbz,nyp)
      real ur(memnx,memny,memnz,memnxyz),ui(memnx,memny,memnz,memnxyz)
      
      integer x,y,z

      if (mbz.eq.1) then
         do y=1,nyp
             do x=1,memnx
               ur(x,y,zb,i)=boxr(x,1,y)
               ui(x,y,zb,i)=boxi(x,1,y)
            end do
         end do
      else
         do z=zb,zb+mbz-1
            do y=1,nyp
               do x=1,memnx
                  ur(x,y,z,i)=boxr(x,z-zb+1,y)
                  ui(x,y,z,i)=boxi(x,z-zb+1,y)
               end do
            end do
         end do
      end if
      
      end subroutine putxy





