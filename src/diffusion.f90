! -*- mode: f90; coding: utf-8 -*-
!-----------------------------------------------------------------------
! Copyright (c) 2019 dcmodel Development Group. All rights reserved.
!-----------------------------------------------------------------------
!>
!> @author S.Takehiro, M.Odaka, Y.Morikawa, Y.Sasaki
!> @copyright Copyright (C) dcmodel Development Group, 2023.
!>            License is MIT/X11. see [COPYRIGHT](@ref COPYRIGHT) in detail
!> @brief Solving 1-D diffusion equation.
!> @details
!> Solving 1-D diffusion equation
!> \f[
!>     \pdv{u}{t} = \kappa \pdv[2]{u}{x}
!> \f]
!> for giving values of \f$u\f$ at \f$x=[0,1]\f$,
!> using [Gtool5](https://www.gfd-dennou.org/library/gtool/gtool5.htm).
!> ![figure](./diffusion.png)
!>
program diffusion

  !> モジュール指定
  use gtool_history

  !> total grid number
  integer, parameter     :: nx=30
  !> total time step
  integer, parameter     :: nt=200
  !> output interval
  integer, parameter     :: ndisp=10
  !> grid interval
  real(8), parameter     :: dx=1.0/(nx-1)
  !> time step
  real(8), parameter     :: dt=0.0005
  !> coordinate valiable
  real(8), dimension(nx) :: x=(/(dx*(i-1),i=1,nx)/)
  !> Temperature
  real(8), dimension(nx) :: temp
  !> thermal diffusion coefficient
  real(8), parameter     :: kappa=1.0


  !> initial time/初期時刻設定
  tinit = 0.0

  !> initial value/初期値設定
  temp = exp(-((x-0.5)/0.1)**2)

  !> Create History/ヒストリー作成
  call HistoryCreate( &
    & file='diffusion.nc',                               &
    & title='Diffusion equation',                        &
    & source='Sample program of gtool_history/gtool5',   &
    & institution='GFD_Dennou Club davis project',       &
    & dims=(/'x','t'/), dimsizes=(/nx,0/),               &
    & longnames=(/'X-coordinate','time        '/),       &
    & units=(/'m','s'/),                                 &
    & origin=real(tinit), interval=real(ndisp*dt) )

  !> Output coordinate/次元変数出力
  call HistoryPut('x',x)

  !> define output variable/出力変数定義
  call HistoryAddVariable( &
    & varname='temp', dims=(/'x','t'/), &
    & longname='temperature', units='K', xtype='double')

  !> Output Variabl
  call HistoryPut('temp',temp)

  !> Time integration
  do it=1,nt
     temp(2:nx-1) = temp(2:nx-1) &
          & + kappa*(temp(3:nx)-2*temp(2:nx-1)+temp(1:nx-2))/dx**2*dt
     if ( mod(it,ndisp) == 0 ) then
        !> Output Variable
        call HistoryPut('temp',temp)
     endif
  end do

  call HistoryClose
  stop
end program diffusion
