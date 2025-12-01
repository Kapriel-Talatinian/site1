#!/bin/bash

# Dossier cible côté Apache
TARGET="/Library/WebServer/Documents/site1"

echo "=== [DEPLOY] Nettoyage du dossier cible ==="
sudo rm -rf "$TARGET"
sudo mkdir -p "$TARGET"

echo "=== [DEPLOY] Copie des fichiers depuis le projet local vers Apache ==="
sudo cp -R ./* "$TARGET"/

echo "=== [DEPLOY] Application des droits pour Apache ==="
sudo chown -R _www:_www "$TARGET"
sudo chmod -R 755 "$TARGET"

echo "=== [DEPLOY] Redémarrage d'Apache ==="
sudo apachectl restart

echo "=== [DEPLOY] Terminé. Vérifie sur http://localhost/site1/index.html ==="
