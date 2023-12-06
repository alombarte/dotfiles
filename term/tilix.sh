#!/bin/sh
# Manage Tilix terminal settings from files

TILIX_CONF_DIR="/home/$USER/.dotfiles/term"
TILIX_CONF_FILE="$TILIX_CONF_DIR/tilix.conf"
BACKUP_FILE="$TILIX_CONF_DIR/tilix_backup_$(date '+%Y_%m_%d_%H_%M').conf"
ACTION=$1

case $ACTION in
save*)
  #Save Tilix terminal settings to a file
  dconf dump /com/gexperts/Tilix/ > $TILIX_CONF_FILE
  echo "Active Tilix content saved to $TILIX_CONF_FILE"
  ;;
load*)
  # Backup first
  dconf dump /com/gexperts/Tilix/ > "$BACKUP_FILE"
  echo "Previous Tilix settings saved to $BACKUP_FILE"

  # Load the settings file into the application
  cat $TILIX_CONF_FILE | dconf load /com/gexperts/Tilix/
  ;;
*)
  echo "Unsupported action. Expected '$0 save' or '$0 load'"
  exit 1
  ;;
esac
