# Para compilar con Fortran
Para poder programar en Fortran es necesario instalar el compilador *gfortran*. Esto se puede hacer desde la terminal. El comando a introducir puede variar según la distribución de Linux que usted esté usando.

Para Archlinux:
```
sudo pacman -S gfortran
```

Para Debian/Ubuntu:
```
sudo apt-get install gfortran
```

Para Fedora:
```
su -c "dnf install gcc-gfortran"
```

![](http://s28.postimg.org/6ugavpu4d/install.png)

En la escritura del programa, puede realizarse mediante el editor de texto predeterminado de su distribución, por ejemplo *gedit* o *kate*.

Para compilar se puede usar el comando

```
gfortran -std=f95 main.f90 evolve.f90 (...) -o XOnda
```

Pero esto puede resultar ser tedioso. Es más recomendable usar un *makefile*, que es un archivo que contiene todas las instrucciones necesarias para compilar el programa.

![](http://s3.postimg.org/wvr40mncj/makefile.png)

En este repositorio se ofrece un archivo *makefile* del cual usted puede hacer uso. [Enlace a archivo makefile de referencia.](https://github.com/CarlosManuelRodr/XOnda/blob/master/xonda/Makefile)

Con esto usted podrá compilar el proyecto situándose con la terminal en el directorio donde se encuentre el *makefile* y escribiendo en la terminal

```
make
```

# Para usar GnuPlot

Para poder visualizar los resultados del programa, *i.e* las gráficas es necesario instalar *gnuplot*, esto se puede hacer desde la terminal.

Para Archlinux:
```
sudo pacman -S gnuplot
```

Para Debian/Ubuntu:
```
sudo apt-get install gnuplot
```

Para Fedora:
```
su -c "dnf install gnuplot"
```