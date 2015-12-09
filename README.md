# XOnda
Programa para resolver la ecuación de onda relativista.

![](http://s7.postimg.org/7obud9pzv/onda.png)

* [Guía de instalación de requisitos en Linux](https://github.com/CarlosManuelRodr/XOnda/blob/master/Tutoriales/Linux.md)
* [Guía de instalación de requisitos en Windows](https://github.com/CarlosManuelRodr/XOnda/blob/master/Tutoriales/Windows.md)
* [Guía de instalación de requisitos en Mac](https://github.com/CarlosManuelRodr/XOnda/blob/master/Tutoriales/Mac.md)

Introducción a la Relatividad
=============================

Citando a John Wheeler, una interpretación compacta de las ecuaciones de Einstein: ”Matter tells spacetime how to curve, and spacetime tells matter how to move”

![](http://s1.postimg.org/b94lgeyrj/image.png)

Todo esto está basado en el entendimiento del espacio y el tiempo como un solo ente, para este ente, la métrica del espacio tiempo es la que indica el intervalo entre dos eventos espacio temporales. La forma en la que medimos las distancias en el espacio tiempo es mediante el elemento de linea:

![](http://s1.postimg.org/7e17duflr/image.png)

Para la métrica mas sencilla (el espacio de Minkowski) () toma la forma:

![](http://s1.postimg.org/n0sgr7tdr/image.png)


Formulación de la Relatividad numerica
======================================

Descomposición del espacio-tiempo en hipersuperficies de tres dimensiones, sigma a lo largo de la coordenada temporal t = cte. Esta técnica es conocida como la formulación ADM de la relatividad numérica. De esta manera se pueden escribir las ecuaciones de Einstein en ecuaciones de evolución que podemos resolver numéricamente

![](http://s4.postimg.org/45rzj8qnx/image.png)

![](http://s4.postimg.org/sxrlqh7ul/image.png)

Solución de la ecuación de onda relativista
===========================================

En este programa nos centraremos a resolver la ecuación de onda (en una dimensión)

![](http://s1.postimg.org/mco7m0k1r/image.png)

que es una ecuación del tipo hiperbólico, mismas que se caracterizan por ser problemas de valores iniciales y a la frontera. La solución en un paso temporal depende del dato en el tiempo inicial. Las diferencias entre uno y otro son las velocidades características, que son finitas para ecuaciones hiperbólicas. Para la solución numérica se usan
Diferencias Finitas y Runge-Kutta.

Por lo que para encontrar la solución a las ecuaciones diferenciales en
el continuo las resolveremos en un espacio-tiempo discretizado mediante
diferencias finitas.