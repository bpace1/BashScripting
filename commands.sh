grep -oP '^\s*\[\K[^]]*(?=\]\s*$)' FILE >> secciones.txt



/home/bd/Documents/concurso/BashScripting


function extraer_seccion() {

  ARCHIVO="$1"

  SECCION="$2"

  sed -n '/^\['$SECCION'.*\]/,/^\[.*\]$/{/^\['$SECCION'.*\]/!{/\[.*\]$/!p}}' "$ARCHIVO"

}



