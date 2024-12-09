#!/bin/bash
# scanRedFile - Escáner de Configuración de Seguridad para Linux
# Copyright (C) 2024 [rojosecurity]

# Este programa es software libre: puede redistribuirlo y/o modificarlo
# bajo los términos de la Licencia Pública General de GNU, versión 3.
# Consulte la Licencia Pública General de GNU para obtener más detalles.
#
# Debería haber recibido una copia de la Licencia Pública General de GNU
# junto con este programa. En caso contrario, consulte <https://www.gnu.org/licenses/>.



# plugins auxiliares para el script 
source plugins/auxiliares.sh
source plugins/Debian/reconOSDebian.sh
source plugins/Debian/cuentasPermisos.sh



# Este script debe ejecutarse bajo los privilegios del super usuario (root)

if [[ $(id -u) -eq 0 ]]; then

    sleep 2

    # Realizamos reconocimiento de distribución (recopilación de datos de la distro) 
    
    if [[ $(cat /proc/version | grep -E "debian") ]];then
        reconocimientoOS
        cuentasypermisos
        verificacionNivelPasswords
        verificacionPasswordVacias
        verificacionArchivosSensibles
    fi

else

    echo -e "${BGRED} ❌ scanRedFile debe ejecutarse bajo privilegios de Super Usuario.${BGRESET}"
    exit 1 

fi

