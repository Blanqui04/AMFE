# Guia de Distribució amb GitHub Releases

## 🎯 Per què GitHub Releases?

GitHub Releases és ideal per:
- ✅ Distribuir l'instal·lador de forma professional
- ✅ Control de versions automàtic
- ✅ Descàrrega directa pels usuaris
- ✅ Notes de versió integrades
- ✅ Estadístiques de descàrregues
- ✅ Gratuït i fiable

---

## 📦 Preparació abans de crear un Release

### 1. Assegura't que tot està preparat

```powershell
# Crea l'instal·lador
.\build_all.ps1

# Verifica que existeix
Test-Path "installer_output\AMFE-Manager-Setup-1.0.0.exe"
```

### 2. Actualitza la documentació

- [ ] `CHANGELOG.md` amb tots els canvis
- [ ] Versió correcta a `setup.py` i `installer_setup.iss`
- [ ] `README.md` actualitzat

### 3. Commit i push dels canvis

```powershell
git add .
git commit -m "Release v1.0.0: Primera versió estable"
git push origin main
```

---

## 🚀 Crear un GitHub Release

### Opció 1: Des de la Web de GitHub (RECOMANAT)

#### Pas 1: Anar a Releases
1. Obre el repositori: https://github.com/Blanqui04/AMFE
2. Fes clic a **"Releases"** (a la dreta)
3. Fes clic a **"Create a new release"** o **"Draft a new release"**

#### Pas 2: Configurar el Release
- **Tag version:** `v1.0.0` (crea-ho nou)
- **Target:** `main` (branch principal)
- **Release title:** `AMFE-S Manager v1.0.0 - Primera Versió`

#### Pas 3: Descripció del Release
Copia aquest text (adapta'l si cal):

```markdown
# 🎉 AMFE-S Manager v1.0.0

Primera versió oficial del gestor professional d'anàlisis AMFE (P-FMEA).

## 📥 Descàrrega i Instal·lació

### Per a Usuaris Finals

**Descarrega l'instal·lador:**
- 💿 **[AMFE-Manager-Setup-1.0.0.exe](ENLLAÇ_AQUÍ)** (~100 MB)

**Instal·lació:**
1. Descarrega el fitxer
2. Fes doble clic sobre l'instal·lador
3. Segueix les instruccions a pantalla
4. Obre l'aplicació des del menú d'inici

**NO cal instal·lar Python ni cap dependència!**

📖 **[Manual d'Usuari](docs/MANUAL_USUARI.md)**

---

## ✨ Característiques Principals

- 📊 **Escaneig automàtic** de processos AMFE
- 📈 **Anàlisi de riscos** abans i després d'accions
- 🎨 **Gràfics professionals** de distribució de riscos
- 💾 **Exportació automàtica** de resultats
- 🌍 **Multiidioma:** Català, Anglès, Polonès
- 🖥️ **Interfície gràfica** intuïtiva amb PyQt5

---

## 📋 Requisits del Sistema

- **Sistema Operatiu:** Windows 10 o superior (64-bit)
- **Memòria RAM:** 4 GB (8 GB recomanat)
- **Espai en disc:** 500 MB lliures
- **Resolució:** 1280x720 o superior

---

## 📚 Documentació

- 📘 [Manual d'Usuari](docs/MANUAL_USUARI.md) - Guia completa en català
- 📗 [Guia de Distribució](docs/GUIA_DISTRIBUCIO.md) - Per desenvolupadors
- 🚀 [Quickstart](QUICKSTART.md) - Inici ràpid

---

## 🆕 Novetats d'aquesta versió

### Afegit
- 🎉 Primera versió estable i completa
- Sistema d'instal·lació professional
- Documentació completa en català
- Suport multiidioma
- Generació automàtica de gràfics
- Exportació de resultats

### Millores
- Interfície d'usuari intuïtiva
- Gestió robusta d'errors
- Sistema de logging integrat

---

## 🐛 Problemes Coneguts

Cap problema crític conegut en aquesta versió.

Si trobes algun error, si us plau [obre un issue](https://github.com/Blanqui04/AMFE/issues).

---

## 🔄 Actualitzacions

Per actualitzar des d'una versió anterior:
1. Descarrega el nou instal·lador
2. Executa'l (no cal desinstal·lar la versió anterior)
3. Les teves dades es conservaran

---

## 📞 Suport

- 📖 [Documentació](docs/)
- 🐛 [Reportar Error](https://github.com/Blanqui04/AMFE/issues)
- 💬 [Discussions](https://github.com/Blanqui04/AMFE/discussions)

---

## ⚖️ Llicència

Aquest projecte està llicenciat sota MIT License - consulta [LICENSE](LICENSE) per detalls.

---

**Data de publicació:** 24 de novembre de 2025  
**Versió:** 1.0.0  
**Checksum SHA256:** (es generarà automàticament)
```

#### Pas 4: Pujar l'instal·lador
- Arrossega el fitxer `installer_output\AMFE-Manager-Setup-1.0.0.exe`
- O fes clic a **"Attach binaries"** i selecciona'l

#### Pas 5: Opcions addicionals
- ✅ **Set as the latest release** (marcar)
- ✅ **Create a discussion** (opcional, recomanat)
- ⬜ **Set as a pre-release** (NO marcar si és versió estable)

#### Pas 6: Publicar
- Fes clic a **"Publish release"**

---

### Opció 2: Des de la Línia de Comandes (amb GitHub CLI)

```powershell
# Instal·la GitHub CLI si no el tens
# https://cli.github.com/

# Autentifica't
gh auth login

# Crea el release amb l'instal·lador
gh release create v1.0.0 `
  installer_output\AMFE-Manager-Setup-1.0.0.exe `
  --title "AMFE-S Manager v1.0.0 - Primera Versió" `
  --notes-file docs\RELEASE_NOTES.md
```

---

## 📊 Després de publicar

### Els usuaris podran:

1. **Accedir al Release:**
   - https://github.com/Blanqui04/AMFE/releases
   - https://github.com/Blanqui04/AMFE/releases/latest

2. **Descarregar directament:**
   - https://github.com/Blanqui04/AMFE/releases/download/v1.0.0/AMFE-Manager-Setup-1.0.0.exe

3. **Veure estadístiques:**
   - Nombre de descàrregues
   - Data de publicació
   - Checksum per verificació

---

## 🔄 Futures Actualitzacions

Per crear una nova versió:

### 1. Prepara la nova versió

```powershell
# Actualitza el codi amb els canvis
# ...

# Incrementa la versió
# - setup.py → version="1.1.0"
# - installer_setup.iss → MyAppVersion "1.1.0"
# - CHANGELOG.md → Afegeix secció [1.1.0]

# Crea el nou instal·lador
.\build_all.ps1
```

### 2. Commit i push

```powershell
git add .
git commit -m "Release v1.1.0: [descripció breu]"
git push origin main
```

### 3. Crea el nou Release

Des de GitHub:
- Tag: `v1.1.0`
- Title: `AMFE-S Manager v1.1.0 - [Nom de la versió]`
- Puja el nou instal·lador
- Publica

---

## 📝 Plantilla de Notes de Versió

Guarda això a `docs/RELEASE_NOTES_TEMPLATE.md`:

```markdown
# AMFE-S Manager v[X.X.X]

Descripció breu dels canvis principals.

## 📥 Descàrrega

💿 **[AMFE-Manager-Setup-X.X.X.exe](URL)**

## 🆕 Novetats

### Afegit
- Nova funcionalitat 1
- Nova funcionalitat 2

### Modificat
- Millora en X
- Optimització de Y

### Corregit
- Bug fix #123
- Resolució de problema Z

## 📋 Requisits

- Windows 10 o superior
- 4 GB RAM (8 GB recomanat)

## 🔄 Actualització

Per actualitzar des de v[X.X.X]:
1. Descarrega el nou instal·lador
2. Executa'l directament

Les dades es conservaran.

---

**Data:** [DATA]  
**Versió:** [X.X.X]
```

---

## 🎯 Bones Pràctiques

### ✅ Fer:
- Versiona correctament (semver: MAJOR.MINOR.PATCH)
- Documenta tots els canvis al CHANGELOG
- Testa l'instal·lador abans de publicar
- Escriu notes de versió clares
- Inclou checksum per verificació
- Mantén un patró de nomenament consistent

### ❌ Evitar:
- Publicar versions sense testar
- Canviar el nom dels fitxers del release
- Eliminar releases antics (a menys que sigui necessari)
- Publicar amb bugs crítics coneguts

---

## 📈 Avantatges de GitHub Releases

### Per als usuaris:
- ✅ Descàrrega ràpida i segura
- ✅ Sempre la darrera versió disponible
- ✅ Historial de versions
- ✅ Notes de versió detallades

### Per a tu (desenvolupador):
- ✅ Control de versions automàtic
- ✅ Estadístiques de descàrregues
- ✅ URLs permanents per cada versió
- ✅ Integració amb CI/CD
- ✅ Badges per README

---

## 🎨 Badge per README

Pots afegir un badge al README.md:

```markdown
[![GitHub release](https://img.shields.io/github/v/release/Blanqui04/AMFE)](https://github.com/Blanqui04/AMFE/releases)
[![GitHub downloads](https://img.shields.io/github/downloads/Blanqui04/AMFE/total)](https://github.com/Blanqui04/AMFE/releases)
```

---

## 🔗 URLs Útils

- **Releases:** https://github.com/Blanqui04/AMFE/releases
- **Latest Release:** https://github.com/Blanqui04/AMFE/releases/latest
- **Descarrega directa v1.0.0:** 
  https://github.com/Blanqui04/AMFE/releases/download/v1.0.0/AMFE-Manager-Setup-1.0.0.exe

---

## 💡 Consell Final

**Crea sempre un "Draft Release" primer:**
1. Puja l'instal·lador
2. Escriu les notes
3. Revisa-ho tot
4. Publica quan estiguis segur

Això evita publicar versions incompletes.

---

**Última actualització:** 24 de novembre de 2025  
**Versió de la guia:** 1.0.0
```
