# GitHub Actions per AMFE-S Manager

Aquesta carpeta conté workflows de GitHub Actions per automatitzar processos del projecte.

## Workflows disponibles

### `release.yml` - Build i Release Automàtic

Aquest workflow s'executa automàticament quan crees un nou tag de versió.

**Quan s'activa:**
- Quan fas push d'un tag com `v1.0.0`, `v1.1.0`, etc.

**Què fa:**
1. Configura l'entorn Python
2. Instal·la totes les dependències
3. Compila les traduccions
4. Crea l'executable amb PyInstaller
5. Instal·la Inno Setup
6. Genera l'instal·lador Windows
7. Crea automàticament un GitHub Release
8. Puja l'instal·lador al release

**Com utilitzar-lo:**

```powershell
# 1. Assegura't que tot està committejat
git add .
git commit -m "Release v1.0.0"

# 2. Crea i puja el tag
git tag v1.0.0
git push origin v1.0.0

# 3. GitHub Actions farà la resta automàticament!
```

**Nota:** Aquest workflow requereix que el repositori sigui públic o tinguis GitHub Actions activat.

## Activar GitHub Actions

1. Ves al teu repositori a GitHub
2. Clica a "Actions"
3. Activa GitHub Actions si està desactivat
4. El workflow s'executarà automàticament quan facis push d'un tag

## Monitoritzar l'execució

- Ves a: https://github.com/Blanqui04/AMFE/actions
- Veuràs l'estat de cada workflow
- Pots veure els logs complets de cada pas

## Avantatges

✅ **Automàtic:** No cal crear l'instal·lador manualment  
✅ **Consistent:** Sempre es crea de la mateixa manera  
✅ **Reproducible:** Qualsevol pot veure com es crea  
✅ **Ràpid:** No cal tenir l'entorn configurat localment  
✅ **Professional:** Sistema utilitzat per projectes grans  

## Alternativa Manual

Si prefereixes crear els releases manualment:
1. Executa `prepare_release.ps1`
2. Segueix les instruccions a `docs/GUIA_GITHUB_RELEASES.md`

---

**Última actualització:** 24 de novembre de 2025
