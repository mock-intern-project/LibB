# Lib B

Repository for static library LibB.

## Requirements

- **CMake**: Version 3.15 or higher
- **VxWorks**: Versions 6.9, 7.0-SR0540 and 7.0-SR0640 are available
- **Windows**: x86-64 architecture

## Installation 

### Common

1. Clone the repository:

```bash
git clone repo_link
```

### Windows

2. Enter to the Windows build scripts folder.

```bash
cd /build_scripts/windows
```

3. Run the .bat files in the following order for debug. For release, run their _release.bat correspondances.
```bash
create_cmake_system_debug.bat
make_all_debug.bat
make_install_debug.bat
```

### VxWorks

2. Select a VxWorks build folder to enter. If you want to use the cmake provided by VxWorks, enter to the following:

```bash
cd /build_scripts/vxworks_shipped_w_cmake
```

If you want to use your own cmake installation, enter to the following:
```bash
cd /build_scripts/vxworks_unshipped_w_cmake
```

3. Before starting to anything, you have to set some environmental variables.

```bash
set "OSNAME="
set "OSVER_MAJOR="
set "OSVER_MINOR="
set "WIND_HOME="
set "TOOLCHAIN_DIR="
set "TOOLCHAIN_FILE="
set "VSB_DIR="
set "BSP_DIR="

set "INSTALL_ROOT_DIR=C:/in_house_software"
```

4. After doing above steps, run the .bat/.sh files in the following order:
(**Note:** if you are using 'unshipped' folder, you will skip the first two lines and you will run '.bat' files instead of '.sh' files.
Below example is given from 'shipped' folder.)

```bash
run_wrenv.bat
run_sh.bat
./create_cmake_system_debug.sh
./make_all_debug.sh
./make_install_debug.sh
```

Run '_release' versions of those files if you want a release build.