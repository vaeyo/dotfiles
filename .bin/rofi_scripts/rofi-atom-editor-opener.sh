#!/usr/bin/env bash

# Various options for the file browser script:
ROFI_ATOMEDIOPE_GENERIC_FO="atom" # command used for opening the selection
ROFI_ATOMEDIOPE_PREV_LOC_FILE="$HOME/.local/share/rofi/rofi_atom-editor-opener_prevloc"
ROFI_ATOMEDIOPE_HISTORY_FILE="$HOME/.local/share/rofi/rofi_atom-editor-opener_history"
ROFI_ATOMEDIOPE_HISTORY_MAXCOUNT=4 # maximum number of history entries
# Comment the next variable to always start in the last visited directory,
# otherwise rofi_fb will start in the specified directory:
ROFI_ATOMEDIOPE_START_DIR="$HOME" # starting directory
# Uncomment the following line to disable history:
ROFI_ATOMEDIOPE_NO_HISTORY=1

# Beginning of the script:
# Create the directory for the files of the script
if [ ! -d $(dirname "${ROFI_ATOMEDIOPE_PREV_LOC_FILE}") ]
then
    mkdir -p "$(dirname "${ROFI_ATOMEDIOPE_PREV_LOC_FILE}")"
    touch "${ROFI_ATOMEDIOPE_PREV_LOC_FILE}"
fi
if [ ! -d $(dirname "${ROFI_ATOMEDIOPE_HISTORY_FILE}") ]
then
    mkdir -p "$(dirname "${ROFI_ATOMEDIOPE_HISTORY_FILE}")"
    touch "${ROFI_ATOMEDIOPE_HISTORY_FILE}"
fi

# Initialize $ROFI_ATOMEDIOPE_CUR_DIR
if [ -d "${ROFI_ATOMEDIOPE_START_DIR}" ]
then
    ROFI_ATOMEDIOPE_CUR_DIR="${ROFI_ATOMEDIOPE_START_DIR}"
else
    ROFI_ATOMEDIOPE_CUR_DIR="$PWD"
fi

# Read last location, otherwise we default to $ROFI_ATOMEDIOPE_START_DIR or $PWD.
if [ -f "${ROFI_ATOMEDIOPE_PREV_LOC_FILE}" ]
then
    ROFI_ATOMEDIOPE_CUR_DIR=$(cat "${ROFI_ATOMEDIOPE_PREV_LOC_FILE}")
fi

# Handle argument.
if [ -n "$@" ]
then
    if [[ "$@" == /* ]]
    then
        ROFI_ATOMEDIOPE_CUR_DIR="$@"
    else
        ROFI_ATOMEDIOPE_CUR_DIR="${ROFI_ATOMEDIOPE_CUR_DIR}/$@"
    fi
fi
# If argument is no directory.
if [[ "${ROFI_ATOMEDIOPE_CUR_DIR}" =~ /.$ ]] || [ ! -d "${ROFI_ATOMEDIOPE_CUR_DIR}" ]
then
    if [ -e "${ROFI_ATOMEDIOPE_CUR_DIR}" ]
    then
        if [[ "${ROFI_ATOMEDIOPE_NO_HISTORY}" -ne 1 ]]
        then
            # Append selected entry to history and remove exceeding entries
            sed -i "s|${ROFI_ATOMEDIOPE_CUR_DIR}|##deleted##|g" "${ROFI_ATOMEDIOPE_HISTORY_FILE}"
            sed -i '/##deleted##/d' "${ROFI_ATOMEDIOPE_HISTORY_FILE}"
            echo "${ROFI_ATOMEDIOPE_CUR_DIR}" >> "${ROFI_ATOMEDIOPE_HISTORY_FILE}"
            if [ $(cat "${ROFI_ATOMEDIOPE_HISTORY_FILE}" | wc -l) -gt ${ROFI_ATOMEDIOPE_HISTORY_MAXCOUNT} ]
            then
                sed -i 1d "${ROFI_ATOMEDIOPE_HISTORY_FILE}"
            fi
        fi
        # Open the selected entry with $ROFI_ATOMEDIOPE_GENERIC_FO
        coproc ( "${ROFI_ATOMEDIOPE_GENERIC_FO}" "${ROFI_ATOMEDIOPE_CUR_DIR}" & > /dev/null  2>&1 )
        if [ -d "${ROFI_ATOMEDIOPE_START_DIR}" ]
        then
            echo "${ROFI_ATOMEDIOPE_START_DIR}" > "${ROFI_ATOMEDIOPE_PREV_LOC_FILE}"
        fi
        exit;
    fi
    exit;
fi

# Process current dir.
if [ -n "${ROFI_ATOMEDIOPE_CUR_DIR}" ]
then
    ROFI_ATOMEDIOPE_CUR_DIR=$(readlink -e "${ROFI_ATOMEDIOPE_CUR_DIR}")
    echo "${ROFI_ATOMEDIOPE_CUR_DIR}" > "${ROFI_ATOMEDIOPE_PREV_LOC_FILE}"
    pushd "${ROFI_ATOMEDIOPE_CUR_DIR}" >/dev/null
fi

# Output to rofi
if [[ "${ROFI_ATOMEDIOPE_NO_HISTORY}" -ne 1 ]]
then
    tac "${ROFI_ATOMEDIOPE_HISTORY_FILE}" | grep "${ROFI_ATOMEDIOPE_CUR_DIR}"
fi
echo "."
echo ".."
ls
# vim:sw=4:ts=4:et:
