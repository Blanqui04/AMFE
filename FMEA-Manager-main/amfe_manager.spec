# -*- mode: python ; coding: utf-8 -*-
"""
PyInstaller spec file for AMFE-S-Manager
Creates a standalone executable with all dependencies
"""

block_cipher = None

import os
import sys
from PyInstaller.utils.hooks import collect_data_files, collect_submodules

# Collect all data files from packages
datas = []
datas += collect_data_files('openpyxl')
datas += collect_data_files('matplotlib')
datas += collect_data_files('pandas')

# Add translation files
datas += [('i18n', 'i18n')]
datas += [('assets', 'assets')]
datas += [('config', 'config')]

# Collect hidden imports
hiddenimports = []
hiddenimports += collect_submodules('openpyxl')
hiddenimports += collect_submodules('matplotlib')
hiddenimports += collect_submodules('PyQt5')
hiddenimports += ['babel.numbers', 'babel.dates']
hiddenimports += ['numpy', 'pandas']

a = Analysis(
    ['amfe_ui.py'],
    pathex=[],
    binaries=[],
    datas=datas,
    hiddenimports=hiddenimports,
    hookspath=[],
    hooksconfig={},
    runtime_hooks=[],
    excludes=['tkinter', 'test', 'unittest', 'pytest'],
    win_no_prefer_redirects=False,
    win_private_assemblies=False,
    cipher=block_cipher,
    noarchive=False,
)

pyz = PYZ(a.pure, a.zipped_data, cipher=block_cipher)

exe = EXE(
    pyz,
    a.scripts,
    [],
    exclude_binaries=True,
    name='AMFE-Manager',
    debug=False,
    bootloader_ignore_signals=False,
    strip=False,
    upx=True,
    console=False,  # No console window for GUI app
    disable_windowed_traceback=False,
    target_arch=None,
    codesign_identity=None,
    entitlements_file=None,
    icon='assets/images/logo_some.png' if os.path.exists('assets/images/logo_some.png') else None,
)

coll = COLLECT(
    exe,
    a.binaries,
    a.zipfiles,
    a.datas,
    strip=False,
    upx=True,
    upx_exclude=[],
    name='AMFE-Manager',
)
