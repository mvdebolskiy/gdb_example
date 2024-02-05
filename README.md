# Debug fortran code locally:

1. Install [VSCode](https://code.visualstudio.com/)
2. Install [fortls](https://pypi.org/project/fortls/) (through pip)
3. Install [fprettify](https://pypi.org/project/fprettify/) (through pip)
4. Add `Modern Fortran extension` to VSCode
5. Set `Modern Fortran` settings to use `fortsls`, `fprettify` and `gfortran`
6. Make *infile.dat* (first integer is the number of integers after, f.e. 4 1 2 3 4)
7. `Ctrl + Shift + B` to build
8. `F5` to debug
9. To use breakpoints add `Fortran Breakpoint Support` extension

# Debug fortran code on an interactive node on fram
0. Read sigma2 [docs](https://documentation.sigma2.no/code_development/debugging)
1. Compile your program with `-g` flag
2. Allocate yourself an [interactive job](https://documentation.sigma2.no/jobs/interactive_jobs.html): `salloc --nodes=1 --time=00:30:00 --qos=devel --account=nn9600k bash`
3. Start `gdb`
4. F.e. make a breakpoint: `b filname.F90:linenumber`
5. Print values of a variable: `print variablename`
6. Continue: `continue`


# Attach GDB to a cesm process on a compute node on betzy:
1. Compile model with a debug option: `./xmlchange DEBUG=TRUE` before build.
2. First figure out what nodes you are on: `squeue --me`
3. Ssh to a node: `ssh username@bXXXX.betzy.sigma2.no`
4. Get process id: `ps -ef | grep cesm`
5. Attach gdb to a process: `gdb --pid pid`
6. Enjoy

...