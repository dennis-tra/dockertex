# 🐳 dockertex
**\#noclutter** - A full tex-live installation inside a docker container to run tex/latex commands. Just prepend your usual tex/latex commands with `dockertex`. For example

```shell
$ dockertex pdflatex example.tex
```
and everything will happen inside the dockertex container. You can test this command in the `example` subdirectory. 

_It is surprisingly fast!_

# Installation

### 🚀 Automatic

Run the supplied setup script with either `--pull` or `--build`. E.g.:

```shell
$ ./setup.sh --pull
```
The setup script was only tested on OS X 10.11.3 (El Capitan). It _should_ work on linux as well.

### 👌 Manual

Run all commands from the project directory.

1. Pull or build the dockertex container:

   ```shell
   # build
   $ docker build -t dentra/dockertex .
   ```
   ```shell
   # pull
   $ docker pull dentra/dockertex:latest
   ```

2. Copy the file `dockertex` to `/usr/local/bin:

   ```shell
   cp ./dockertex /usr/local/bin/dockertex
   ```
   or create a symlink.

The setup script is not doing anything else than running these commands.
