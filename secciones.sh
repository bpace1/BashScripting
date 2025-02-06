#!/bin/bash

# En este script vamos a chequear que secciones de los diferentes subniveles de cada nivel que tiene el juego "oh-my-git".
# ¿Cuáles son las secciones? Las referidas a la configuración del juego, como por ejemplo: [congrats] y [win]

# Pero antes de eso, tenemos que clonar el repositorio. Para estar seguros, lo chequeo.

echo "Inicio de chequeo de repositorio en el directorio."


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

echo "Filtrando secciones de los niveles."

# Para filtrar las secciones precisamos utilizar REGEX (expresiones regulares).
# Recomendación: esta página es intiuitiva y arma la expresión necesaria https://regex-generator.olafneumann.org

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
        echo nivel: $LEVEL - subnivel:  $SUBLEVEL >> secciones.txt # ¿Por qué se utilizan dos signos >>?
        grep -oP '^\s*\[\K[^]]*(?=\]\s*$)' "$SUBLEVEL_PATH" >> secciones.txt
done
done

echo "Se guardó un archivo 'secciones.txt' con la información."

# ¿Por qué los path están encerrado entre comillas dobles?
# ¿Existe otra manera de resolver este ejercicio?
# ¿Es conveniente implementar funciones? Si la rta. es sí, ¿Dónde?
