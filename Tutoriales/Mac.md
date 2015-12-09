# Para compilar con Fortran
Para poder programar en Fortran es necesario descargar *Xcode*, lo cual puede hacerse directamente desde la *App Store*

![](http://s1.postimg.org/axoamm3gf/Xcode.png)

Para la primera vez que se compile el código se hace con la orden 

```
sudo make ondauv
```

![](http://s3.postimg.org/mf6xl9bhv/First_Run.png)

En la escritura del programa, puede realizarse desde la terminal mediante *emacs*

![](http://s3.postimg.org/vkfaf4ewj/abrirarchivo.png)

![](http://s1.postimg.org/qun2jbvun/Vistaemacs.png)

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

Para poder visualizar los resultados del programa, *i.e* las gráficas es necesario instalar *gnuplot*, para ello la manera más sencilla es instalar *Homebrew*, lo cual puede hacerse desde la página [http://brew.sh](http://brew.sh "brew.sh")

![](http://s3.postimg.org/bgvo32mwj/Homebrew.png)

Una vez instalado, desde la terminal se introduce el comando

```
brew install gnuplot --with-qt
```

![](http://s3.postimg.org/km40wxqb7/Installgnuplot.png)

Puede ser necesario descargar *Aqua Term* para visualizar las gráficas de Gnuplot.