# Instal·lació de AMFE Manager

## Descàrrega

Descarrega la última versió des de [GitHub Releases](https://github.com/Blanqui04/AMFE/releases/latest)

## Instal·lació per a usuaris finals

### Pas 1: Descarregar l'installer
1. Ves a la pàgina de [Releases](https://github.com/Blanqui04/AMFE/releases)
2. Descarrega el fitxer `AMFE-Manager-Setup-X.X.X.exe` de la última versió
3. Guarda'l a una ubicació fàcil d'accedir (per exemple, Escriptori o Descàrregues)

### Pas 2: Executar l'installer
1. **Doble clic** sobre el fitxer descarregat `AMFE-Manager-Setup-X.X.X.exe`
2. Si Windows mostra un avís de seguretat ("Windows ha protegit el teu PC"), fes clic a **"Més informació"** i després **"Executar igualment"**
3. Si et demana permisos d'administrador, fes clic a **"Sí"**

### Pas 3: Seguir l'assistent d'instal·lació
1. **Pantalla de benvinguda**: Fes clic a **"Següent"**
2. **Carpeta de destinació**: Deixa la ubicació per defecte `C:\Program Files\AMFE Manager\` i fes clic a **"Següent"**
3. **Carpeta del menú d'inici**: Deixa per defecte i fes clic a **"Següent"**
4. **Tasques addicionals**: 
   - ✅ Marca "Crear icona a l'escriptori" (recomanat)
   - ✅ Marca "Crear icona al menú d'inici"
   - Fes clic a **"Següent"**
5. **Confirmar instal·lació**: Revisa la configuració i fes clic a **"Instal·lar"**
6. **Espera**: La barra de progrés mostrarà l'estat de la instal·lació (30-60 segons)
7. **Finalitzar**: Fes clic a **"Finalitzar"**

### Pas 4: Executar l'aplicació

Pots obrir AMFE Manager de tres maneres:

#### Opció 1: Des de l'escriptori
- **Doble clic** a la icona "AMFE Manager" de l'escriptori

#### Opció 2: Des del menú d'inici
1. Prem la tecla **Windows** o fes clic al botó d'inici
2. Escriu **"AMFE Manager"**
3. Fes clic a l'aplicació quan aparegui

#### Opció 3: Des de la carpeta d'instal·lació
1. Obre l'Explorador de fitxers
2. Navega a `C:\Program Files\AMFE Manager\`
3. Doble clic a `AMFE-Manager.exe`

## Requisits del sistema

- **Sistema operatiu**: Windows 10 o superior (64-bit)
- **RAM**: Mínim 4 GB (recomanat 8 GB)
- **Espai en disc**: ~100 MB per a la instal·lació
- **Permisos**: Permisos d'administrador per a la instal·lació (només durant la instal·lació)

## Ubicació dels fitxers

- **Aplicació**: `C:\Program Files\AMFE Manager\`
- **Logs**: `C:\Users\[NomUsuari]\AppData\Local\AMFE-Manager\logs\`
- **Desinstal·lador**: `C:\Program Files\AMFE Manager\unins000.exe`

## Desinstal·lació

### Opció 1: Des del Panell de Control
1. Obre **"Configuració"** de Windows
2. Ves a **"Aplicacions"** → **"Aplicacions i característiques"**
3. Busca **"AMFE Manager"**
4. Fes clic a **"Desinstal·lar"**
5. Confirma la desinstal·lació

### Opció 2: Des de la carpeta d'instal·lació
1. Navega a `C:\Program Files\AMFE Manager\`
2. Executa `unins000.exe`
3. Segueix l'assistent de desinstal·lació

## Resolució de problemes

### L'aplicació no s'inicia
- **Solució 1**: Fes clic dret a la icona → "Executar com a administrador"
- **Solució 2**: Comprova els logs a `%LOCALAPPDATA%\AMFE-Manager\logs\`
- **Solució 3**: Reinstal·la l'aplicació

### Windows Defender bloqueja l'installer
1. Això és normal per a aplicacions noves sense signatura digital
2. Fes clic a **"Més informació"**
3. Fes clic a **"Executar igualment"**
4. El programa és segur, només no està signat digitalment

### Error durant la instal·lació
- **Tanca** qualsevol instància anterior d'AMFE Manager
- **Desinstal·la** la versió antiga si n'hi ha
- **Reinicia** l'ordinador
- **Torna a intentar** la instal·lació

### L'aplicació funciona lent
- Comprova que tens almenys 4 GB de RAM lliure
- Tanca altres aplicacions pesades
- Reinicia l'aplicació

## Actualitzacions

Per actualitzar a una nova versió:
1. **No cal desinstal·lar** la versió antiga
2. **Descarrega** el nou installer des de GitHub Releases
3. **Executa** el nou installer
4. L'installer actualitzarà automàticament la versió existent

## Suport

- **Issues**: [GitHub Issues](https://github.com/Blanqui04/AMFE/issues)
- **Documentació**: Consulta els fitxers README i docs/ del repositori
- **Logs**: Revisa `%LOCALAPPDATA%\AMFE-Manager\logs\` per a més informació sobre errors

## Notes de seguretat

✅ **Aquest installer és segur**:
- Codi font completament obert i auditable
- No conté malware, virus ni spyware
- No recopila dades personals
- No es connecta a internet sense el teu permís
- Els logs es guarden localment al teu ordinador

⚠️ **Descarrega només des de**:
- GitHub Releases oficial: https://github.com/Blanqui04/AMFE/releases
- No descarreguis des de llocs de tercers

## Licència

Aquest programari està distribuït sota llicència [INSERIR LLICÈNCIA]. Consulta el fitxer LICENSE per a més detalls.
