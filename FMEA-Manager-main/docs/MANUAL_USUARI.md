# Manual d'Usuari - AMFE-S Manager

## Benvingut a AMFE-S Manager

AMFE-S Manager és una aplicació dissenyada per ajudar-te a gestionar i analitzar dades d'AMFE (Anàlisi Modal de Fallades i Efectes) de processos de fabricació de manera senzilla i professional.

---

## 📋 Requisits del Sistema

- **Sistema Operatiu:** Windows 10 o superior (64-bit recomanat)
- **Memòria RAM:** Mínim 4 GB (8 GB recomanat)
- **Espai en disc:** 500 MB lliures
- **Resolució de pantalla:** 1280x720 o superior

---

## 🚀 Instal·lació

### Pas 1: Descarrega l'instal·lador
Obre el fitxer `AMFE-Manager-Setup-X.X.X.exe` que t'han proporcionat.

### Pas 2: Executa l'instal·lador
- Fes doble clic sobre l'instal·lador
- Si Windows pregunta si vols permetre canvis, fes clic a **Sí**
- Selecciona l'idioma preferit (Català, Anglès o Castellà)

### Pas 3: Segueix l'assistent
- Llegeix i accepta els termes de llicència
- Escull la carpeta d'instal·lació (per defecte va bé)
- Marca l'opció de crear icona a l'escriptori si la vols
- Fes clic a **Instal·lar**

### Pas 4: Finalitza
- Un cop acabada la instal·lació, pots executar l'aplicació immediatament
- Trobaràs l'aplicació al menú d'inici: **AMFE-S Manager**

---

## 🎯 Com utilitzar l'aplicació

### Primera execució

Quan obris l'aplicació per primera vegada:

1. **Selecciona el directori de processos**
   - Fes clic al botó "Seleccionar Directori"
   - Navega fins a la carpeta on tens els teus arxius AMFE
   - Confirma la selecció

2. **Escaneig automàtic**
   - L'aplicació detectarà automàticament tots els processos disponibles
   - Es mostrarà una llista amb els processos trobats

### Anàlisi de dades AMFE

#### Selecció de procés
- A la llista desplegable, selecciona el procés que vols analitzar
- L'aplicació llegirà tots els arxius Excel d'AMFE del procés

#### Generació de gràfics
- Fes clic al botó **"Combinar i Analitzar"**
- L'aplicació processarà les dades i generarà:
  - Gràfic de distribució de riscos (abans de les accions)
  - Gràfic de distribució de riscos (després de les accions)
  - Estadístiques resumides

#### Exportació de resultats
- Els gràfics es guarden automàticament a:
  - `C:\Users\[ElTeuUsuari]\AppData\Roaming\AMFE-Manager\exports\`
- També pots seleccionar una carpeta personalitzada per guardar-los

---

## 📊 Interpretació dels resultats

### Gràfics de risc

L'aplicació genera gràfics circulars que mostren la distribució de riscos:

- **🔴 Risc Alt:** Requereix atenció immediata
- **🟠 Risc Mitjà:** Cal revisar i planificar accions
- **🟢 Risc Baix:** Situació controlada

### Comparativa abans/després

- **Abans:** Mostra els riscos inicials identificats
- **Després:** Mostra l'impacte de les accions correctives
- L'objectiu és reduir els riscos alts i mitjans

---

## ⚙️ Configuració

### Idioma
L'aplicació detecta automàticament l'idioma del sistema, però pots canviar-lo a:
- Català (per defecte)
- Anglès
- Polonès

### Rutes de dades
Per defecte, l'aplicació guarda les dades a:
- **Exports:** `%APPDATA%\AMFE-Manager\exports\`
- **Logs:** `%APPDATA%\AMFE-Manager\logs\`
- **Configuració:** `%APPDATA%\AMFE-Manager\config\`

---

## 🔧 Resolució de problemes

### L'aplicació no s'obre
1. Comprova que tens Windows 10 o superior
2. Intenta executar com a administrador (botó dret > Executar com a administrador)
3. Verifica que l'antivirus no està bloquejant l'aplicació

### No es detecten els processos
1. Verifica que la carpeta seleccionada conté arxius Excel (.xlsx)
2. Assegura't que els arxius segueixen el format AMFE correcte
3. Comprova que tens permisos de lectura sobre els arxius

### Errors en llegir arxius Excel
1. Tanca tots els arxius Excel oberts
2. Assegura't que els arxius no estan protegits amb contrasenya
3. Verifica que els arxius no estan corruptes

### Els gràfics no es generen
1. Comprova que hi ha dades vàlides als arxius AMFE
2. Verifica que tens espai en disc disponible
3. Revisa el fitxer de log per més detalls: `%APPDATA%\AMFE-Manager\logs\`

---

## 📞 Suport i contacte

Si tens problemes o necessites ajuda:

- **Documentació tècnica:** Consulta el fitxer README.md a la carpeta d'instal·lació
- **Logs d'error:** Revisa els logs a `%APPDATA%\AMFE-Manager\logs\`
- **Repositori GitHub:** https://github.com/Blanqui04/AMFE

---

## 📝 Consells d'ús

✅ **Bones pràctiques:**
- Mantén els arxius AMFE organitzats per processos en carpetes separades
- Fes còpies de seguretat periòdiques dels teus arxius
- Revisa regularment els gràfics per detectar tendències
- Documenta les accions correctives aplicades

❌ **Evita:**
- Modificar els arxius Excel mentre l'aplicació els està processant
- Canviar l'estructura dels arxius AMFE (columnes i format)
- Guardar arxius temporals (~$) a les carpetes de processos

---

## 🔄 Actualitzacions

Per actualitzar l'aplicació:
1. Descarrega la darrera versió de l'instal·lador
2. Executa el nou instal·lador (no cal desinstal·lar la versió anterior)
3. Les teves dades i configuració es conservaran

---

## 📄 Llicència

AMFE-S Manager és programari lliure. Consulta el fitxer LICENSE per més detalls.

---

**Versió del manual:** 1.0.0  
**Data:** Novembre 2025  
**Idioma:** Català

---

*Aquest manual està dissenyat per a usuaris sense coneixements tècnics. Si necessites informació més detallada o documentació per a desenvolupadors, consulta la documentació tècnica al repositori del projecte.*
