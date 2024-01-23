#!/bin/bash

# Obtener la versión del archivo /etc/os-release
get_os_version() {
    if [ -e /etc/os-release ]; then
        source /etc/os-release
        if [ -n "$VERSION_ID" ]; then
            echo "La versión del sistema operativo es: $VERSION_ID"
        else
            echo "No se pudo obtener la versión del sistema operativo"
        fi
    else
        echo "El archivo /etc/os-release no existe"
    fi
}

# Función para cambiar entre los repositorios de la UCLV y la Universidad de Oriente
change_repository() {
    echo "Seleccione una opción:"
    echo "1. Agregar repositorio de la UCLV a sources.list"
    echo "2. Agregar repositorio de la Universidad de Oriente a sources.list"
    read -p "Opción: " option
    case $option in
        1) 
            echo "Añadiendo repositorio de la UCLV a sources.list..."
            echo "deb http://repositorio.uclv.cu/ubuntu focal main" | sudo tee -a /etc/apt/sources.list
            echo "El repositorio de la UCLV se ha añadido exitosamente a sources.list"
            ;;
        2)
            echo "Añadiendo repositorio de la Universidad de Oriente a sources.list..."
            echo "deb http://repositorio.uo.cu/ubuntu focal main" | sudo tee -a /etc/apt/sources.list
            echo "El repositorio de la Universidad de Oriente se ha añadido exitosamente a sources.list"
            ;;
        *)
            echo "Opción no válida"
            ;;
    esac
}

# Menú principal
echo "Seleccione una opción:"
echo "1. Obtener la versión del sistema operativo"
echo "2. Cambiar entre los repositorios de la UCLV y la Universidad de Oriente"
read -p "Opción: " main_option
case $main_option in
    1) 
        get_os_version
        ;;
    2)
        change_repository
        ;;
    *)
        echo "Opción no válida"
        ;;
esac
