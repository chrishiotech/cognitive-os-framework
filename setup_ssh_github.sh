#!/bin/bash
# setup_ssh_github.sh — Helper seguro para configurar SSH (NO almacena secrets)
echo "🔐 Configurando SSH key para GitHub (solo en tu máquina local)..."
if [ ! -f ~/.ssh/id_ed25519 ] && [ ! -f ~/.ssh/id_rsa ]; then
  echo "🔑 Generando nueva SSH key Ed25519 en TU MÁQUINA LOCAL (~/.ssh/)..."
  ssh-keygen -t ed25519 -C "chrishio@aguirretechconsulting.com" -f ~/.ssh/id_ed25519 -N ""
else
  echo "✅ SSH key ya existe en tu máquina local"
fi
eval "$(ssh-agent -s)" > /dev/null 2>&1
[ -f ~/.ssh/id_ed25519 ] && ssh-add ~/.ssh/id_ed25519 2>/dev/null || ssh-add ~/.ssh/id_rsa 2>/dev/null
echo ""; echo "➡️  PRÓXIMO PASO MANUAL (en GitHub.com):"
echo "   1. Copia tu clave pública: pbcopy < ~/.ssh/id_ed25519.pub"
echo "   2. Ve a GitHub → Settings → SSH and GPG keys → New SSH key"
echo "   3. Pega el contenido y guarda"
echo "   4. Prueba: ssh -T git@github.com"
