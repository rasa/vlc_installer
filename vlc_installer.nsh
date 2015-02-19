# Copyright (c) 2005-2015 Ross Smith II (http://smithii.com). MIT Licensed.

!ifdef INSTALL_IN_PROGRAMFILES64

!insertmacro DownloadEXE "1"    "VLC ${VLC_VER} 64-Bit Installer"   "http://download.videolan.org/pub/videolan/vlc/${VLC_VER}/win64/vlc-${VLC_VER}-win64.exe" "" ''
!insertmacro DownloadAny "1"    "libaacs.dll - AACS dynamic library (64 bit)"    "http://vlc-bluray.whoknowsmy.name/files/win64/libaacs.dll" "" ''

!else

!insertmacro DownloadEXE "1"    "VLC ${VLC_VER} 32-Bit Installer"   "http://download.videolan.org/pub/videolan/vlc/${VLC_VER}/win32/vlc-${VLC_VER}-win32.exe" "" ''
!insertmacro DownloadAny "1"    "libaacs.dll - AACS dynamic library (32 bit)"    "http://vlc-bluray.whoknowsmy.name/files/win32/libaacs.dll" "" ''

!endif

!insertmacro DownloadAny "1"  "KEYDB.cfg - Keys database"    "http://vlc-bluray.whoknowsmy.name/files/KEYDB.cfg" "KEYDB.cfg" ''
