############################################################################################
#      NSIS Installation Script created by NSIS Quick Setup Script Generator v1.09.18
#               Entirely Edited with NullSoft Scriptable Installation System                
#              by Vlasis K. Barkas aka Red Wine red_wine@freemail.gr Sep 2006               
############################################################################################

!include "GetVC.nsh"

!define APP_NAME "CANAL View"
!define COMP_NAME "Rusoku technologies UAB"
!define WEB_SITE "http://www.rusoku.com"
!define VERSION "00.01.00.00"
!define COPYRIGHT "RUSOKU © 2019"
!define DESCRIPTION "CANAL test library application"
!define INSTALLER_NAME "D:\QTinstall\output\CANAL_View_install_32bit_v${VERSION}.exe"
!define MAIN_APP_EXE "CanalView.exe"
!define INSTALL_TYPE "SetShellVarContext current"
!define REG_ROOT "HKCU"
!define REG_APP_PATH "Software\Microsoft\Windows\CurrentVersion\App Paths\${MAIN_APP_EXE}"
!define UNINSTALL_PATH "Software\Microsoft\Windows\CurrentVersion\Uninstall\${APP_NAME}"

!define REG_START_MENU "Start Menu Folder"

var SM_Folder

######################################################################

VIProductVersion  "${VERSION}"
VIAddVersionKey "ProductName"  "${APP_NAME}"
VIAddVersionKey "CompanyName"  "${COMP_NAME}"
VIAddVersionKey "LegalCopyright"  "${COPYRIGHT}"
VIAddVersionKey "FileDescription"  "${DESCRIPTION}"
VIAddVersionKey "FileVersion"  "${VERSION}"

######################################################################

SetCompressor ZLIB
Name "${APP_NAME}"
Caption "${APP_NAME}"
OutFile "${INSTALLER_NAME}"
BrandingText "${APP_NAME}"
XPStyle on
InstallDirRegKey "${REG_ROOT}" "${REG_APP_PATH}" ""
InstallDir "$PROGRAMFILES\CANAL View"

######################################################################

!include "MUI.nsh"

!define MUI_ABORTWARNING
!define MUI_UNABORTWARNING

!insertmacro MUI_PAGE_WELCOME

!ifdef LICENSE_TXT
!insertmacro MUI_PAGE_LICENSE "${LICENSE_TXT}"
!endif

!insertmacro MUI_PAGE_DIRECTORY

!ifdef REG_START_MENU
!define MUI_STARTMENUPAGE_NODISABLE
!define MUI_STARTMENUPAGE_DEFAULTFOLDER "CANAL View"
!define MUI_STARTMENUPAGE_REGISTRY_ROOT "${REG_ROOT}"
!define MUI_STARTMENUPAGE_REGISTRY_KEY "${UNINSTALL_PATH}"
!define MUI_STARTMENUPAGE_REGISTRY_VALUENAME "${REG_START_MENU}"
!insertmacro MUI_PAGE_STARTMENU Application $SM_Folder
!endif

!insertmacro MUI_PAGE_INSTFILES

!define MUI_FINISHPAGE_RUN "$INSTDIR\${MAIN_APP_EXE}"
!insertmacro MUI_PAGE_FINISH

!insertmacro MUI_UNPAGE_CONFIRM

!insertmacro MUI_UNPAGE_INSTFILES

!insertmacro MUI_UNPAGE_FINISH

!insertmacro MUI_LANGUAGE "English"


###########################################################################

Section -MainProgram

# Krauna is interneto
#!insertmacro GetVC++

#vietinis
Call  InstallVcRedist

#DetailPrint "sleeping..."
#Sleep 8000
#DetailPrint "back to work"

;	Push $0

;${If} ${RunningX64}
;	ReadRegDWORD $0 HKLM "Software\WOW6432Node\Microsoft\VisualStudio\14.0\VC\Runtimes\x64" "Major"
;${Else}
;	ReadRegDWORD $0 HKLM "Software\WOW6432Node\Microsoft\VisualStudio\14.0\VC\Runtimes\x86" "Major"
;${EndIf}

;	${If} $0 == '14'
;		DetailPrint "VC++ already installed"
;		#Sleep 3000
;		goto installed			
;	${EndIf}  	
;
;	DetailPrint "VC++ not installed"
;	#Sleep 3000	

;	#MessageBox MB_OK '$$0 is "$0"'

;	Pop $0

;${If} ${RunningX64} 
;	ExecWait 'vcredist_x64.exe /q /norestart'
;${else}
;	ExecWait 'vcredist_x86.exe /q /norestart'
;${EndIf}

;installed:


${INSTALL_TYPE}
SetOverwrite ifnewer
SetOutPath "$INSTDIR"

File "D:\QTinstall\32bit\canal32.dll"
File "D:\QTinstall\32bit\CanalView.exe"
File "D:\QTinstall\32bit\Qt5Core.dll"
File "D:\QTinstall\32bit\Qt5Gui.dll"
File "D:\QTinstall\32bit\Qt5Svg.dll"
File "D:\QTinstall\32bit\Qt5Widgets.dll"
#File "D:\QTinstall\32bit\vc_redist.x86.exe"

SetOutPath "$INSTDIR\translations"
File "D:\QTinstall\32bit\translations\qt_ar.qm"
File "D:\QTinstall\32bit\translations\qt_bg.qm"
File "D:\QTinstall\32bit\translations\qt_ca.qm"
File "D:\QTinstall\32bit\translations\qt_cs.qm"
File "D:\QTinstall\32bit\translations\qt_da.qm"
File "D:\QTinstall\32bit\translations\qt_de.qm"
File "D:\QTinstall\32bit\translations\qt_en.qm"
File "D:\QTinstall\32bit\translations\qt_es.qm"
File "D:\QTinstall\32bit\translations\qt_fi.qm"
File "D:\QTinstall\32bit\translations\qt_fr.qm"
File "D:\QTinstall\32bit\translations\qt_gd.qm"
File "D:\QTinstall\32bit\translations\qt_he.qm"
File "D:\QTinstall\32bit\translations\qt_hu.qm"
File "D:\QTinstall\32bit\translations\qt_it.qm"
File "D:\QTinstall\32bit\translations\qt_ja.qm"
File "D:\QTinstall\32bit\translations\qt_ko.qm"
File "D:\QTinstall\32bit\translations\qt_lv.qm"
File "D:\QTinstall\32bit\translations\qt_pl.qm"
File "D:\QTinstall\32bit\translations\qt_ru.qm"
File "D:\QTinstall\32bit\translations\qt_sk.qm"
File "D:\QTinstall\32bit\translations\qt_uk.qm"
SetOutPath "$INSTDIR\styles"
File "D:\QTinstall\32bit\styles\qwindowsvistastyle.dll"
SetOutPath "$INSTDIR\platforms"
File "D:\QTinstall\32bit\platforms\qwindows.dll"
SetOutPath "$INSTDIR\imageformats"
File "D:\QTinstall\32bit\imageformats\qgif.dll"
File "D:\QTinstall\32bit\imageformats\qicns.dll"
File "D:\QTinstall\32bit\imageformats\qico.dll"
File "D:\QTinstall\32bit\imageformats\qjpeg.dll"
File "D:\QTinstall\32bit\imageformats\qsvg.dll"
File "D:\QTinstall\32bit\imageformats\qtga.dll"
File "D:\QTinstall\32bit\imageformats\qtiff.dll"
File "D:\QTinstall\32bit\imageformats\qwbmp.dll"
File "D:\QTinstall\32bit\imageformats\qwebp.dll"
SetOutPath "$INSTDIR\iconengines"
File "D:\QTinstall\32bit\iconengines\qsvgicon.dll"
SectionEnd

######################################################################

Section -Icons_Reg
SetOutPath "$INSTDIR"
WriteUninstaller "$INSTDIR\uninstall.exe"

!ifdef REG_START_MENU
!insertmacro MUI_STARTMENU_WRITE_BEGIN Application
CreateDirectory "$SMPROGRAMS\$SM_Folder"
CreateShortCut "$SMPROGRAMS\$SM_Folder\${APP_NAME}.lnk" "$INSTDIR\${MAIN_APP_EXE}"
CreateShortCut "$DESKTOP\${APP_NAME}.lnk" "$INSTDIR\${MAIN_APP_EXE}"
!ifdef WEB_SITE
WriteIniStr "$INSTDIR\${APP_NAME} website.url" "InternetShortcut" "URL" "${WEB_SITE}"
CreateShortCut "$SMPROGRAMS\$SM_Folder\${APP_NAME} Website.lnk" "$INSTDIR\${APP_NAME} website.url"
!endif
!insertmacro MUI_STARTMENU_WRITE_END
!endif

!ifndef REG_START_MENU
CreateDirectory "$SMPROGRAMS\CANAL View"
CreateShortCut "$SMPROGRAMS\CANAL View\${APP_NAME}.lnk" "$INSTDIR\${MAIN_APP_EXE}"
CreateShortCut "$DESKTOP\${APP_NAME}.lnk" "$INSTDIR\${MAIN_APP_EXE}"
!ifdef WEB_SITE
WriteIniStr "$INSTDIR\${APP_NAME} website.url" "InternetShortcut" "URL" "${WEB_SITE}"
CreateShortCut "$SMPROGRAMS\CANAL View\${APP_NAME} Website.lnk" "$INSTDIR\${APP_NAME} website.url"
!endif
!endif

WriteRegStr ${REG_ROOT} "${REG_APP_PATH}" "" "$INSTDIR\${MAIN_APP_EXE}"
WriteRegStr ${REG_ROOT} "${UNINSTALL_PATH}"  "DisplayName" "${APP_NAME}"
WriteRegStr ${REG_ROOT} "${UNINSTALL_PATH}"  "UninstallString" "$INSTDIR\uninstall.exe"
WriteRegStr ${REG_ROOT} "${UNINSTALL_PATH}"  "DisplayIcon" "$INSTDIR\${MAIN_APP_EXE}"
WriteRegStr ${REG_ROOT} "${UNINSTALL_PATH}"  "DisplayVersion" "${VERSION}"
WriteRegStr ${REG_ROOT} "${UNINSTALL_PATH}"  "Publisher" "${COMP_NAME}"

!ifdef WEB_SITE
WriteRegStr ${REG_ROOT} "${UNINSTALL_PATH}"  "URLInfoAbout" "${WEB_SITE}"
!endif
SectionEnd

######################################################################

Section Uninstall
${INSTALL_TYPE}
Delete "$INSTDIR\canal32.dll"
Delete "$INSTDIR\CanalView.exe"
Delete "$INSTDIR\Qt5Core.dll"
Delete "$INSTDIR\Qt5Gui.dll"
Delete "$INSTDIR\Qt5Svg.dll"
Delete "$INSTDIR\Qt5Widgets.dll"
#Delete "$INSTDIR\vcredist_x64.exe"
#Delete "$INSTDIR\vc_redist.x64.exe"
Delete "$INSTDIR\translations\qt_ar.qm"
Delete "$INSTDIR\translations\qt_bg.qm"
Delete "$INSTDIR\translations\qt_ca.qm"
Delete "$INSTDIR\translations\qt_cs.qm"
Delete "$INSTDIR\translations\qt_da.qm"
Delete "$INSTDIR\translations\qt_de.qm"
Delete "$INSTDIR\translations\qt_en.qm"
Delete "$INSTDIR\translations\qt_es.qm"
Delete "$INSTDIR\translations\qt_fi.qm"
Delete "$INSTDIR\translations\qt_fr.qm"
Delete "$INSTDIR\translations\qt_gd.qm"
Delete "$INSTDIR\translations\qt_he.qm"
Delete "$INSTDIR\translations\qt_hu.qm"
Delete "$INSTDIR\translations\qt_it.qm"
Delete "$INSTDIR\translations\qt_ja.qm"
Delete "$INSTDIR\translations\qt_ko.qm"
Delete "$INSTDIR\translations\qt_lv.qm"
Delete "$INSTDIR\translations\qt_pl.qm"
Delete "$INSTDIR\translations\qt_ru.qm"
Delete "$INSTDIR\translations\qt_sk.qm"
Delete "$INSTDIR\translations\qt_uk.qm"
Delete "$INSTDIR\styles\qwindowsvistastyle.dll"
Delete "$INSTDIR\platforms\qwindows.dll"
Delete "$INSTDIR\imageformats\qgif.dll"
Delete "$INSTDIR\imageformats\qicns.dll"
Delete "$INSTDIR\imageformats\qico.dll"
Delete "$INSTDIR\imageformats\qjpeg.dll"
Delete "$INSTDIR\imageformats\qsvg.dll"
Delete "$INSTDIR\imageformats\qtga.dll"
Delete "$INSTDIR\imageformats\qtiff.dll"
Delete "$INSTDIR\imageformats\qwbmp.dll"
Delete "$INSTDIR\imageformats\qwebp.dll"
Delete "$INSTDIR\iconengines\qsvgicon.dll"
 
RmDir "$INSTDIR\iconengines"
RmDir "$INSTDIR\imageformats"
RmDir "$INSTDIR\platforms"
RmDir "$INSTDIR\styles"
RmDir "$INSTDIR\translations"
 
Delete "$INSTDIR\uninstall.exe"
!ifdef WEB_SITE
Delete "$INSTDIR\${APP_NAME} website.url"
!endif

RmDir "$INSTDIR"

!ifdef REG_START_MENU
!insertmacro MUI_STARTMENU_GETFOLDER "Application" $SM_Folder
Delete "$SMPROGRAMS\$SM_Folder\${APP_NAME}.lnk"
!ifdef WEB_SITE
Delete "$SMPROGRAMS\$SM_Folder\${APP_NAME} Website.lnk"
!endif
Delete "$DESKTOP\${APP_NAME}.lnk"

RmDir "$SMPROGRAMS\$SM_Folder"
!endif

!ifndef REG_START_MENU
Delete "$SMPROGRAMS\CANAL View\${APP_NAME}.lnk"
!ifdef WEB_SITE
Delete "$SMPROGRAMS\CANAL View\${APP_NAME} Website.lnk"
!endif
Delete "$DESKTOP\${APP_NAME}.lnk"

RmDir "$SMPROGRAMS\CANAL View"
!endif

DeleteRegKey ${REG_ROOT} "${REG_APP_PATH}"
DeleteRegKey ${REG_ROOT} "${UNINSTALL_PATH}"
SectionEnd


######################################################################

; install Visual Studio 2008 C++ redistributable
Function InstallVcRedist
         SetOutPath '$TEMP'
         SetOverwrite on
         ;file work
         File 'D:\QTinstall\32bit\vc_redist.x86.exe'
     ExecWait '"$TEMP\vc_redist.x86.exe" /q /norestart'
    Delete "$TEMP\vc_redist.x86.exe"
FunctionEnd

