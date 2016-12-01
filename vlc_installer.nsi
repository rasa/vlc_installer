# Copyright (c) 2005-2016 Ross Smith II (http://smithii.com). MIT Licensed.

!define VLC_VER ${PRODUCT_VERSION}
#!define INSTALL_IN_PROGRAMFILES64

!define PRODUCT_NAME "vlc_installer"
!define PRODUCT_DIR "VideoLAN"
#!define PRODUCT_VERSION "1.0"
!ifdef INSTALL_IN_PROGRAMFILES64
	!define PRODUCT_DESC "VLC™ Freeware Installer ${PRODUCT_VERSION} (64-Bit)"
!else
	!define PRODUCT_DESC "VLC™ Freeware Installer ${PRODUCT_VERSION} (32-Bit)"
!endif
!define PRODUCT_TRADEMARKS "VLC™ and VideoLAN™ are trademarks of VideoLAN (http://videolan.org)"

!addincludedir "../nsislib"
!addincludedir "nsislib"

!include "config.nsh"
!include "DumpLog.nsh"

!undef PRODUCT_EXE
!undef PRODUCT_FILE
!define NO_DESKTOP_ICONS
#!define ADD_INSTDIR_TO_PATH

!define COPYDIR "$EXEDIR"
!define NOEXTRACTPATH
!define UNZIP_DIR "$INSTDIR"

!ifdef INSTALL_IN_PROGRAMFILES64
	InstType "All - VLC 64-bit - All Windows 64-bit versions"
!else
	InstType "All - VLC 32-bit - All Windows versions"
!endif
InstType "None"

!include "common.nsh"

# !macro DumpLogMacro sectionin title url
# 	!undef _SECTION_NO
# 	!define _SECTION_NO ${SECTION_NO}
# 	!undef SECTION_NO
# 	!define /math SECTION_NO ${_SECTION_NO} + 1
#
# 	Section "${title}" Section${SECTION_NO}
# 		SectionIn ${sectionin}
#
# 		GetTempFileName $0
# 		Push $0
# 		Call DumpLog
# 	SectionEnd
#
# 	!insertmacro appendfile "Section${SECTION_NO}" "${url}"
# !macroend

!include "vlc_installer.nsh"

!ifdef INSTALL_IN_PROGRAMFILES64

Section "-hidden64"
	#SectionIn 2
	IfSilent 0 not_silent
		IfFileExists "$EXEDIR\vlc-${VLC_VER}-win64.exe" 0 vlc_done
			DetailPrint 'Executing "$EXEDIR\vlc-${VLC_VER}-win64.exe" /D="$INSTDIR\VLC"...'
			ExecWait '"$EXEDIR\vlc-${VLC_VER}-win64.exe" /S /D="$INSTDIR\VLC"' $0
			DetailPrint '"$EXEDIR\vlc-${VLC_VER}-win64.exe" returned $0'
			Goto vlc_done
	not_silent:
		IfFileExists "$EXEDIR\vlc-${VLC_VER}-win64.exe" 0 vlc_done
			DetailPrint 'Executing "$EXEDIR\vlc-${VLC_VER}-win64.exe" /D="$INSTDIR\VLC"...'
			ExecWait '"$EXEDIR\vlc-${VLC_VER}-win64.exe" /D="$INSTDIR\VLC"' $0
			DetailPrint '"$EXEDIR\vlc-${VLC_VER}-win64.exe" returned $0'
	vlc_done:
	CopyFiles /SILENT "$EXEDIR\KEYDB.cfg" "$APPDATA\aacs\KEYDB.cfg"
	CopyFiles /SILENT "$EXEDIR\libaacs.dll" "$INSTDIR\VLC\libaacs.dll"
SectionEnd

!else

Section "-hidden32"
	#SectionIn 1
	IfSilent 0 not_silent
		IfFileExists "$EXEDIR\vlc-${VLC_VER}-win32.exe" 0 vlc_done
			DetailPrint 'Executing "$EXEDIR\vlc-${VLC_VER}-win32.exe" /D="$INSTDIR\VLC"...'
			ExecWait '"$EXEDIR\vlc-${VLC_VER}-win32.exe" /S /D="$INSTDIR\VLC"' $0
			DetailPrint '"$EXEDIR\vlc-${VLC_VER}-win32.exe" returned $0'
			Goto vlc_done
	not_silent:
		IfFileExists "$EXEDIR\vlc-${VLC_VER}-win32.exe" 0 vlc_done
			DetailPrint 'Executing "$EXEDIR\vlc-${VLC_VER}-win32.exe" /D="$INSTDIR\VLC"...'
			ExecWait '"$EXEDIR\vlc-${VLC_VER}-win32.exe" /D="$INSTDIR\VLC"' $0
			DetailPrint '"$EXEDIR\vlc-${VLC_VER}-win32.exe" returned $0'
	vlc_done:
	CopyFiles /SILENT "$EXEDIR\KEYDB.cfg" "$APPDATA\aacs\KEYDB.cfg"
	CopyFiles /SILENT "$EXEDIR\libaacs.dll" "$INSTDIR\VLC\libaacs.dll"
SectionEnd

!endif

Section uninstall
	IfFileExists "$INSTDIR\VLC\uninstall.exe" 0 uninstall_done
		DetailPrint 'Executing "$INSTDIR\VLC\uninstall.exe /S"...'
		ExecWait '"$INSTDIR\VLC\uninstall.exe /S"'
		DetailPrint '"$INSTDIR\VLC\uninstall.exe /S" returned $0'
	uninstall_done:
SectionEnd
