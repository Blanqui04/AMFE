"""
AMFE-S-Manager Setup Configuration
Professional packaging for distribution
"""
from setuptools import setup, find_packages

with open("README.md", "r", encoding="utf-8") as fh:
    long_description = fh.read()

with open("requirements.txt", "r", encoding="utf-8") as fh:
    requirements = [line.strip() for line in fh if line.strip() and not line.startswith("#")]

setup(
    name="amfe-s-manager",
    version="1.0.0",
    author="AMFE Team",
    author_email="contact@amfe.com",
    description="Gestor professional d'anàlisis AMFE (P-FMEA) per a processos de fabricació",
    long_description=long_description,
    long_description_content_type="text/markdown",
    url="https://github.com/Blanqui04/AMFE",
    packages=find_packages(),
    classifiers=[
        "Development Status :: 4 - Beta",
        "Intended Audience :: Manufacturing",
        "Topic :: Office/Business",
        "License :: OSI Approved :: MIT License",
        "Programming Language :: Python :: 3",
        "Programming Language :: Python :: 3.8",
        "Programming Language :: Python :: 3.9",
        "Programming Language :: Python :: 3.10",
        "Programming Language :: Python :: 3.11",
        "Operating System :: Microsoft :: Windows",
    ],
    python_requires=">=3.8",
    install_requires=requirements,
    entry_points={
        "console_scripts": [
            "amfe-manager=amfe_ui:main",
        ],
        "gui_scripts": [
            "amfe-manager-gui=amfe_ui:main",
        ],
    },
    include_package_data=True,
    package_data={
        "": ["*.yaml", "*.po", "*.mo", "*.png", "*.jpg", "*.ico"],
        "i18n": ["**/*.po", "**/*.mo"],
        "assets": ["**/*"],
    },
    zip_safe=False,
)
