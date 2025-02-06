#!/bin/bash

# Este es un script que almacena todos los chequeos de los niveles en un archivo llamado "chequeos.txt".
# Se reutiliza una parte del código del script "secciones.sh".

# Esta es una función que dado un archivo y el nombre de una sección, extrae las condiciones de la sección [win] de todos los niveles.
function extraer_seccion() {

  ARCHIVO="$1"

  SECCION="$2"

  sed -n '/^\['$SECCION'.*\]/,/^\[.*\]$/{/^\['$SECCION'.*\]/!{/\[.*\]$/!p}}' "$ARCHIVO"

}

# Guardo en una variable el nombre de la carpeta del juego oh-my-git.
REPOSITORIO="oh-my-git"


# Se chequea si el directorio existe, si existe  imprime un mensaje. En caso contrario, clona el repositorio.
if [ -d $REPOSITORIO ]
then
        echo "Existe el Repositorio de oh-my-git."
else
        echo "Clonando Repositorio..."
        $(git clone https://github.com/git-learning-game/oh-my-git.git)
fi


# --- Me aseguré que el repositorio exista en el directorio donde estoy trabajando. Ahora empiezo el chequeo de secciones. ---

# Extraigo el path para evitar errores en la ejecución.
MY_PATH=$(pwd)

#echo $MY_PATH

LEVELS="levels"

FULL_PATH="$MY_PATH/$REPOSITORIO/$LEVELS"

#echo $FULL_PATH

LEVELS_LIST=$(ls "$FULL_PATH")

echo "Filtrando chequeos de los niveles."

# Para filtrar las secciones utilizamos la función extraer_sección

for LEVEL in $LEVELS_LIST  # Itero sobre los diferentes niveles. Es decir, paso por cada uno de ellos.
do
        if [ "$LEVEL" = "sequence" ]; then
                continue
        fi
        LEVEL_PATH=$FULL_PATH/$LEVEL
        for SUBLEVEL in $(ls "$LEVEL_PATH") # Itero ahora sobre los sub-niveles. Esto se llama for anidado. Tengo un for dentro de otro.
						# El resultado será "pasar" por cada nivel con sus respectivo(s) sub-nivel(es).
do
        if [ "$SUBLEVEL" = "sequence" ]; then
                continue
        fi
        SUBLEVEL_PATH=$LEVEL_PATH/$SUBLEVEL
        echo nivel: $LEVEL - subnivel:  $SUBLEVEL >> chequeos.txt # ¿Por qué se utilizan dos signos >>?
        extraer_seccion "$SUBLEVEL_PATH" 'win' >> chequeos.txt
done
done
