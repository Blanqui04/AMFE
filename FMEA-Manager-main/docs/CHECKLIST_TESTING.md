# Checklist de Verificació - AMFE-S Manager

## ✅ Abans de distribuir l'instal·lador

### 1. Verificació del Codi
- [ ] Tot el codi està committejat al repositori
- [ ] No hi ha errors de sintaxi
- [ ] No hi ha TODOs crítics pendents
- [ ] La versió està actualitzada a tots els fitxers:
  - [ ] `setup.py`
  - [ ] `installer_setup.iss`
  - [ ] `CHANGELOG.md`

### 2. Build de l'Executable
- [ ] Executar `build_executable.ps1` sense errors
- [ ] L'executable es genera a `dist\AMFE-Manager\`
- [ ] La mida de l'executable és raonable (~150-250 MB)
- [ ] Les carpetes de recursos estan incloses:
  - [ ] `i18n/` (traduccions)
  - [ ] `assets/` (imatges)
  - [ ] `config/` (configuració)

### 3. Test de l'Executable (sense instal·lar)
- [ ] Executar `dist\AMFE-Manager\AMFE-Manager.exe`
- [ ] L'aplicació s'obre sense errors
- [ ] La interfície es mostra correctament
- [ ] Es pot seleccionar un directori
- [ ] Es detecten processos correctament
- [ ] Es poden processar dades AMFE
- [ ] Es generen gràfics correctament
- [ ] Els gràfics es guarden correctament
- [ ] Les traduccions funcionen (provar en 2+ idiomes)
- [ ] No apareixen errors a la consola (executar amb `--debug` si cal)

### 4. Build de l'Instal·lador
- [ ] Executar `build_installer.ps1` sense errors
- [ ] L'instal·lador es genera a `installer_output\`
- [ ] La mida de l'instal·lador és raonable (~80-120 MB)
- [ ] El nom del fitxer és correcte: `AMFE-Manager-Setup-X.X.X.exe`

### 5. Test de l'Instal·lador
#### En PC de test / Màquina Virtual
- [ ] L'instal·lador s'executa sense errors
- [ ] L'assistent d'instal·lació funciona correctament
- [ ] Es poden seleccionar opcions (idioma, carpeta, icona escriptori)
- [ ] La instal·lació es completa amb èxit
- [ ] Es crea la carpeta al menú d'inici
- [ ] Es crea la icona a l'escriptori (si s'ha marcat)
- [ ] Es creen les carpetes de dades d'usuari:
  - [ ] `%APPDATA%\AMFE-Manager\data\`
  - [ ] `%APPDATA%\AMFE-Manager\exports\`
  - [ ] `%APPDATA%\AMFE-Manager\logs\`

### 6. Test de l'Aplicació Instal·lada
- [ ] L'aplicació s'obre des del menú d'inici
- [ ] L'aplicació s'obre des de l'escriptori
- [ ] Totes les funcions principals funcionen:
  - [ ] Selecció de directori
  - [ ] Detecció de processos
  - [ ] Processament de dades
  - [ ] Generació de gràfics
  - [ ] Exportació de resultats
- [ ] Les traduccions funcionen correctament
- [ ] No hi ha errors visibles
- [ ] L'aplicació no es penja

### 7. Test del Desinstal·lador
- [ ] El desinstal·lador es troba al menú d'inici
- [ ] El desinstal·lador s'executa correctament
- [ ] S'eliminen tots els fitxers de l'aplicació
- [ ] S'elimina la carpeta del menú d'inici
- [ ] S'elimina la icona de l'escriptori
- [ ] Es conserven les dades d'usuari (opcional, segons configuració)

### 8. Tests en Diferents Configuracions
- [ ] Windows 10 (64-bit)
- [ ] Windows 11 (64-bit)
- [ ] Amb antivirus actiu (verificar que no bloqueja)
- [ ] Amb firewall actiu
- [ ] Amb permisos d'usuari limitats
- [ ] En PC sense Python instal·lat
- [ ] En PC sense les dependències instal·lades

### 9. Tests d'Usabilitat
- [ ] Un usuari no tècnic pot instal·lar l'aplicació
- [ ] La interfície és intuïtiva
- [ ] Els missatges d'error són comprensibles
- [ ] La documentació és clara i accessible

### 10. Documentació
- [ ] `MANUAL_USUARI.md` està actualitzat
- [ ] `GUIA_DISTRIBUCIO.md` està actualitzada
- [ ] `README.md` està actualitzat
- [ ] `CHANGELOG.md` té tots els canvis documentats
- [ ] Els enllaços de la documentació funcionen
- [ ] No hi ha referències a versions antigues

### 11. Seguretat i Qualitat
- [ ] L'antivirus no detecta falsos positius
- [ ] No hi ha informació sensible al codi (contrasenyes, claus, etc.)
- [ ] Les dependències estan actualitzades
- [ ] No hi ha vulnerabilitats conegudes

### 12. Preparació per Distribució
- [ ] Crear una còpia de backup del codi
- [ ] Guardar l'instal·lador en un lloc segur
- [ ] Preparar notes de versió / comunicació
- [ ] Preparar suport per possibles preguntes

---

## 🐛 Si trobes problemes

### Problemes comuns i solucions

**L'executable no arranca:**
- Verifica que totes les dependències estan al .spec
- Rebuilda amb `build_executable.ps1`
- Prova en mode debug: `dist\AMFE-Manager\AMFE-Manager.exe --debug`

**L'instal·lador dona error:**
- Verifica que l'executable existeix
- Comprova els permisos d'escriptura
- Revisa el fitxer .iss per errors de sintaxi

**L'aplicació es penja:**
- Revisa els logs a `%APPDATA%\AMFE-Manager\logs\`
- Prova amb dades més petites
- Verifica que els arxius AMFE són vàlids

**Errors de traducció:**
- Recompila les traduccions: `pybabel compile -d i18n`
- Verifica que els fitxers .mo existeixen

---

## 📝 Notes

- **Temps estimat de testing complet:** 2-3 hores
- **Recomanació:** Fer tests en almenys 2 PCs diferents
- **Important:** Testar amb dades reals, no només amb exemples

---

## ✅ Aprovació Final

- [ ] Tots els tests han passat
- [ ] La documentació és correcta
- [ ] L'aplicació està preparada per distribuir
- [ ] Hi ha un pla de suport preparat

**Aprovat per:** ___________________  
**Data:** ___________________  
**Versió:** ___________________

---

**Última actualització:** 24 de novembre de 2025  
**Versió del checklist:** 1.0.0
