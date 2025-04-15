#!/bin/bash

# Menú interactivo
while true; do
  echo "========= MENU DE SERVICIOS ========="
  echo "1. Listar contenido de un directorio"
  echo "2. Crear un archivo de texto"
  echo "3. Comparar dos archivos de texto"
  echo "4. Mostrar líneas usando AWK"
  echo "5. Buscar líneas usando GREP"
  echo "6. Salir"
  echo "====================================="
  read -p "Seleccione una opción (1-6): " opcion

  case $opcion in
    1)
      read -p "Ingrese la ruta absoluta de la carpeta: " ruta
      if [ -d "$ruta" ]; then
        echo "Contenido de $ruta:"
        ls "$ruta"
      else
        echo "La ruta ingresada no es válida o no existe."
      fi
      ;;
    2)
      read -p "Ingrese el nombre del archivo a crear: " archivo
      read -p "Ingrese el texto a almacenar: " texto
      echo "$texto" > "$archivo"
      echo "Archivo '$archivo' creado con éxito."
      ;;
    3)
      read -p "Ingrese el primer archivo a comparar: " archivo1
      read -p "Ingrese el segundo archivo a comparar: " archivo2
      if [[ -f "$archivo1" && -f "$archivo2" ]]; then
        echo "Diferencias entre archivos:"
        diff "$archivo1" "$archivo2"
      else
        echo "Uno o ambos archivos no existen."
      fi
      ;;
    4)
      read -p "Ingrese el archivo para usar AWK: " archivoawk
      if [ -f "$archivoawk" ]; then
        echo "Mostrando líneas con AWK (campo 1 y 2):"
        awk '{print $1, $2}' "$archivoawk"
      else
        echo "Archivo no válido."
      fi
      ;;
    5)
      read -p "Ingrese el archivo para buscar: " archivogrep
      read -p "Ingrese la palabra a buscar: " palabra
      if [ -f "$archivogrep" ]; then
        echo "Resultados de búsqueda con GREP:"
        grep "$palabra" "$archivogrep"
      else
        echo "Archivo no válido."
      fi
      ;;
    6)
      echo "Saliendo del menú... ¡Hasta luego!"
      break
      ;;
    *)
      echo "Opción no válida. Intente nuevamente."
      ;;
  esac

  echo "" # espacio visual
done
