#!/bin/bash

# En este script vamos a chequear que secciones tiene el juego "oh-my-git".

# Pero antes de eso, tenemos que clonar el repositorio. Para estar seguros, lo chequeo.

# Extraigo el path para evitar errores en la ejecución.
MY_PATH=$(pwd)

#echo $MY_PATH

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


LEVELS="levels"

FULL_PATH="$MY_PATH/$REPOSITORIO/$LEVELS"

#echo $FULL_PATH

LEVELS_LIST=$(ls "$FULL_PATH")


# Para filtrar las secciones precisamos utilizar REGEX.
# Esta página es intiuitiva y arma la expresión https://regex-generator.olafneumann.org
for LEVEL in $LEVELS_LIST
do
        if [ "$LEVEL" = "sequence" ]; then
                continue
        fi
        LEVEL_PATH=$FULL_PATH/$LEVEL
        for SUBLEVEL in $(ls "$LEVEL_PATH")
do
        if [ "$SUBLEVEL" = "sequence" ]; then
                continue
        fi
        SUBLEVEL_PATH=$LEVEL_PATH/$SUBLEVEL
        echo nivel: $LEVEL - subnivel:  $SUBLEVEL
        #grep -oP  '\[\K[^][]*(?=])' "$SUBLEVEL_PATH"
#       grep -E '^[a-zA-Z ]' "$SUBLEVEL_PATH"
#
        grep -E '^[a-zA-Z]+$' "$SUBLEVEL_PATH"
done
done

# ¿Por qué los path están encerrado entre comillas dobles?
# ¿Existe otra manera de resolver este ejercicio?
# ¿Es conveniente implementar funciones? ¿Dónde?
