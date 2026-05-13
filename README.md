# All-In-One-Runtime-Installer-V2


## Usage

**1. Download the latest release package from [here](https://github.com/Saideens-Libraries/All-in-One-Runtime-Installer-V2/releases).**
 
**2. Extract the package to your desired location.**

**3. Run** `All in One Runtime Installer (AutoAdmin).bat` **as administrator.**
- This version automatically requests administrator privileges using UAC and VBScript.

**4. If automatic elevation does not work, run** `All in One Runtime Installer (ManualAdmin).bat` **as administrator manually.**

**5. Follow the on-screen instructions to complete the installation.**

---

An all-in-one Windows runtime installer for automatically installing:

- Microsoft Visual C++ Redistributables
- .NET Frameworks & SDK LTS Runtimes
- DirectX Redistributables 
- Additional Microsoft runtime dependencies 

Perfect for:
- Fresh Windows installs
- Gaming PCs
- Repairing missing DLL/runtime errors
- Preparing systems for applications and games

This installer uses official Microsoft runtime packages and automates the installation process in one click.

---

## Features

- One-click runtime installation
- Automatic administrator elevation
- Manual administrator mode included
- Installs official Microsoft runtime packages
- Includes DirectX, Visual C++, and .NET runtimes
- Portable and easy to use
- Automatic reboot prompt after installation
- Supports unattended runtime installation

---

## Included Components

### Visual C++ Redistributables
- Visual C++ 2005
- Visual C++ 2008
- Visual C++ 2010
- Visual C++ 2012
- Visual C++ 2013
- Visual C++ 2015–2022

### DirectX Runtime
- DirectX End-User Runtimes (June 2010)

### .NET
- .NET Framework installers
- .NET SDK installers
- .NET LTS Runtime installers

### Other Runtimes
- Additional Microsoft runtime dependencies

---

## Requirements

- Windows 10 / Windows 11
- Administrator privileges
- Internet connection (if runtime packages need downloading)

---

## Notes

- Do not rename any files or folders.
- Keep the original folder structure intact.
- Some runtime installations may require a reboot.
- Runtime installers are downloaded from official Microsoft sources.

---

## Common Errors Fixed

- MSVCP140.dll missing
- VCRUNTIME140.dll missing
- DirectX errors
- 0xc000007b application error
- Missing Visual C++ Redistributables
- .NET Runtime missing

## Folder Structure

```txt
All-in-One-Runtime-Installer/
├── All in One Runtime Installer (AutoAdmin).bat
├── All in One Runtime Installer (ManualAdmin).bat
├── runtime_installer_fixed.bat
├── README.md
├── .Net-Installers/
├── DirectX-Redist-Jun-2010/
├── Other-Runtimes/
└── Visual-C-Runtimes/
