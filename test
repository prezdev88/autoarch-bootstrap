#!/bin/bash

# Ruta al archivo de configuración de xfce4-terminal
config_file="$HOME/.config/xfce4/terminal/terminalrc"

# Verificar si el archivo de configuración existe
if [ -f "$config_file" ]; then
    # Actualizar el shell predeterminado en el archivo de configuración
    sed -i 's/^SHELL=.*/SHELL=fish/' "$config_file"
    echo "xfce4-terminal shell set to fish."
else
    echo "Error: xfce4-terminal configuration file not found."
    exit 1
fi
