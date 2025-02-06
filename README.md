# Concurso docente de la Facultad de Ciencias Exactas, Ingeniería y Agrimensura.
Tecnicatura Universitaria en Inteligencia Artificial.

## Consigna

Dentro del repositorio de git: https://github.com/git-learning-game/oh-my-git.git se encuentra el código de un juego para aprender y practicar el uso de git. En él encontrará una carpeta llamada levels, dentro de ésta verá subcarpetas con los nombres de cada nivel del juego. En dichas subcarpetas hay archivos con la configuración de cada nivel. Estos archivos de configuración tienen distintas secciones que definen el comportamiento del juego. Por ejemplo bajo la etiqueta [congrats] verá el mensaje que se da cuando se completó el nivel.  En la sección [win] se encuentran instrucciones de Bash para chequear que se cumpla una determinada condición que indica si se ganó ya ese nivel. 

**Ejercicio 1.**   Use instrucciones de Bash para generar un archivo llamado secciones en el que se encuentren todas las posibles distintas secciones de la configuración del juego.

**Ejercicio 2.**    Use instrucciones de Bash para generar un archivo llamado chequeos que contenga los textos presentes en la sección [win] de todos los niveles. Puede valerse de la siguiente función de Bash o su comando principal para obtener el contenido de una sección:

``` 
extraer_seccion() {

  ARCHIVO="$1"

  SECCION="$2"

  sed -n '/^\['$SECCION'.*\]/,/^\[.*\]$/{/^\['$SECCION'.*\]/!{/\[.*\]$/!p}}' "$ARCHIVO"``Use `code` in your Markdown file.``
} 
``` 

**Ejercicio 3.**   Elija uno de los chequeos de la sección [win] del nivel que desee y explique su funcionamiento. 
