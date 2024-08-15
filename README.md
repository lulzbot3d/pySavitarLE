# pySavitarLE

<p align="center">
    <a href="https://github.com/lulzbot3d/pySavitarLE/actions/workflows/conan-package.yml" alt="Conan Package">
        <img src="https://github.com/lulzbot3d/pySavitarLE/actions/workflows/conan-package.yml/badge.svg" /></a>
    <a href="https://github.com/lulzbot3d/pySavitarLE/issues" alt="Open Issues">
        <img src="https://img.shields.io/github/issues/lulzbot3d/pySavitarLE" /></a>
    <a href="https://github.com/lulzbot3d/pySavitarLE/pulls" alt="Pull Requests">
        <img src="https://img.shields.io/github/issues-pr/lulzbot3d/pySavitarLE" /></a>
    <a href="https://github.com/lulzbot3d/pySavitarLE" alt="Repo Size">
        <img src="https://img.shields.io/github/repo-size/lulzbot3d/pySavitarLE?style=flat" /></a>
    <a href="https://github.com/lulzbot3d/pySavitarLE/blob/master/LICENSE" alt="License">
        <img src="https://img.shields.io/github/license/lulzbot3d/pySavitarLE?style=flat" /></a>
</p>

This library contains the Python bindings for loading 3mf files using Savitar.

## License

![License](https://img.shields.io/github/license/lulzbot3d/pySavitarLE?style=flat)  
pySavitar is released under terms of the LGPLv3 License. Terms of the license can be found in the LICENSE file. Or at
http://www.gnu.org/licenses/lgpl.html

> But in general it boils down to:
> **You need to share the source of any pySavitarLE modifications if you make an application with pySavitarLE.**

## System Requirements

### Windows
- Python 3.6 or higher
- Ninja 1.10 or higher
- VS2022 or higher
- CMake 3.23 or higher
- nmake
- sip 6.5.0 or higher
- Conan 1.56.0

### MacOs
- Python 3.6 or higher
- Ninja 1.10 or higher
- apply clang 11 or higher
- CMake 3.23 or higher
- make
- sip 6.5.0 or higher
- Conan 1.56.0

### Linux
- Python 3.6 or higher
- Ninja 1.10 or higher
- gcc 12 or higher
- CMake 3.23 or higher
- make
- sip 6.5.0 or higher
- Conan 1.56.0

## How To Build

> **Note:**  
> We are currently in the process of switch our builds and pipelines to an approach which uses [Conan](https://conan.io/)
> and pip to manage our dependencies, which are stored on our JFrog Artifactory server and in the pypi.org.
> At the moment not everything is fully ported yet, so bare with us.

If you have never used [Conan](https://conan.io/) read their [documentation](https://docs.conan.io/en/latest/index.html)
which is quite extensive and well maintained. Conan is a Python program and can be installed using pip

### 1. Configure Conan

```bash
pip install conan==1.56
conan config install https://github.com/lulzbot3d/conan-config-le.git
conan profile new default --detect --force
```

Community developers would have to remove the Conan cura-le repository because it requires credentials,

LulzBot developers need to request an account for our JFrog Artifactory server from IT
```bash
conan remote remove cura-le
```

### 2. Clone pySavitarLE
```bash
git clone https://github.com/lulzbot3d/pySavitarLE.git
cd pySavitarLE
```

### 3. Install & Build pySavitar (Release OR Debug)

#### Release
```bash
conan install . --build=missing --update
# optional for a specific version: conan install . pysavitarle/<version>@<user>/<channel> --build=missing --update
conan build .
# or
sip-install
```

#### Debug

```bash
conan install . --build=missing --update build_type=Debug
conan build .
# or
sip-install
```

## Creating a new pySavitarLE Conan package

To create a new pySavitarLE Conan package such that it can be used in CuraLE and UraniumLE, run the following command:

```shell
conan create . pysavitarle/<version>@<username>/<channel> --build=missing --update
```

This package will be stored in the local Conan cache (`~/.conan/data` or `C:\Users\username\.conan\data` ) and can be used in downstream
projects, such as CuraLE and UraniumLE by adding it as a requirement in the `conanfile.py` or in `conandata.yml`.

Note: Make sure that the used `<version>` is present in the conandata.yml in the pySavitarLE root

You can also specify the override at the commandline, to use the newly created package, when you execute the `conan install`
command in the root of the consuming project, with:


```shell
conan install . -build=missing --update --require-override=pysavitarle/<version>@<username>/<channel>
```

## Developing pySavitarLE In Editable Mode

You can use your local development repository downsteam by adding it as an editable mode package.
This means you can test this in a consuming project without creating a new package for this project every time.

```bash
    conan editable add . pysavitarle/<version>@<username>/<channel>
```

Then in your downsteam projects (Cura) root directory override the package with your editable mode package.  

```shell
conan install . -build=missing --update --require-override=pysavitarle/<version>@<username>/<channel>
```
