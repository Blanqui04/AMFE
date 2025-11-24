; Script d'instal·lació per AMFE-S-Manager
; Crea un instal·lador professional per Windows
; Requereix Inno Setup 6 o superior: https://jrsoftware.org/isinfo.php

#define MyAppName "AMFE-S Manager"
#define MyAppVersion "1.0.0"
#define MyAppPublisher "AMFE Team"
#define MyAppURL "https://github.com/Blanqui04/AMFE"
#define MyAppExeName "AMFE-Manager.exe"

[Setup]
; Informació bàsica de l'aplicació
AppId={{A1B2C3D4-E5F6-7890-ABCD-EF1234567890}
AppName={#MyAppName}
AppVersion={#MyAppVersion}
AppPublisher={#MyAppPublisher}
AppPublisherURL={#MyAppURL}
AppSupportURL={#MyAppURL}
AppUpdatesURL={#MyAppURL}
DefaultDirName={autopf}\{#MyAppName}
DefaultGroupName={#MyAppName}
AllowNoIcons=yes
LicenseFile=LICENSE
InfoBeforeFile=docs\LLEGEIX-ME.txt
OutputDir=installer_output
OutputBaseFilename=AMFE-Manager-Setup-{#MyAppVersion}
SetupIconFile=assets\images\logo_some.png
Compression=lzma2/max
SolidCompression=yes
WizardStyle=modern
PrivilegesRequired=admin
ArchitecturesInstallIn64BitMode=x64

; Idiomes disponibles
[Languages]
Name: "catalan"; MessagesFile: "compiler:Languages\Catalan.isl"
Name: "english"; MessagesFile: "compiler:Default.isl"
Name: "spanish"; MessagesFile: "compiler:Languages\Spanish.isl"

; Fitxers a instal·lar
[Files]
Source: "dist\AMFE-Manager\{#MyAppExeName}"; DestDir: "{app}"; Flags: ignoreversion
Source: "dist\AMFE-Manager\*"; DestDir: "{app}"; Flags: ignoreversion recursesubdirs createallsubdirs
Source: "README.md"; DestDir: "{app}"; Flags: ignoreversion
Source: "docs\*"; DestDir: "{app}\docs"; Flags: ignoreversion recursesubdirs
Source: "config\settings.example.yaml"; DestDir: "{app}\config"; Flags: ignoreversion

; Icones del menú d'inici i escriptori
[Icons]
Name: "{group}\{#MyAppName}"; Filename: "{app}\{#MyAppExeName}"
Name: "{group}\Manual d'Usuari"; Filename: "{app}\docs\MANUAL_USUARI.pdf"
Name: "{group}\{cm:UninstallProgram,{#MyAppName}}"; Filename: "{uninstallexe}"
Name: "{autodesktop}\{#MyAppName}"; Filename: "{app}\{#MyAppExeName}"; Tasks: desktopicon

; Tasques opcionals
[Tasks]
Name: "desktopicon"; Description: "{cm:CreateDesktopIcon}"; GroupDescription: "{cm:AdditionalIcons}"; Flags: unchecked

; Executar després de la instal·lació
[Run]
Filename: "{app}\{#MyAppExeName}"; Description: "{cm:LaunchProgram,{#StringChange(MyAppName, '&', '&&')}}"; Flags: nowait postinstall skipifsilent

; Codi personalitzat
[Code]
function InitializeSetup(): Boolean;
begin
  Result := True;
  MsgBox('Benvingut a l''instal·lador d''AMFE-S Manager!' + #13#10 + 
         'Aquesta aplicació us ajudarà a gestionar els vostres anàlisis AMFE.', 
         mbInformation, MB_OK);
end;

procedure CurStepChanged(CurStep: TSetupStep);
begin
  if CurStep = ssPostInstall then
  begin
    // Crear carpeta per dades d'usuari
    ForceDirectories(ExpandConstant('{userappdata}\AMFE-Manager\data'));
    ForceDirectories(ExpandConstant('{userappdata}\AMFE-Manager\exports'));
    ForceDirectories(ExpandConstant('{userappdata}\AMFE-Manager\logs'));
  end;
end;
