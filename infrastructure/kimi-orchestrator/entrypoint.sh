#!/bin/bash
set -e

# Configura Git
git config --global user.name "${GIT_USER_NAME:-Artico AI}"
git config --global user.email "${GIT_USER_EMAIL:-ai@articocapital.com}"

# Inicializa workspace
mkdir -p /workspace/code /workspace/logs /workspace/docs

# Configura Kimi CLI se não existir
if [ ! -f /root/.kimi/config.json ]; then
    mkdir -p /root/.kimi
    cat > /root/.kimi/config.json <<EOF
{
  "model": "${KIMI_MODEL:-kimi-k2.5}",
  "api_key": "${KIMI_API_KEY}",
  "mcp_servers": [
    "http://artico-mcp-fs:3000",
    "http://artico-mcp-git:3000"
  ],
  "cost_limit": {
    "daily_max_tokens": 5000000,
    "alert_threshold": 0.8
  }
}
EOF
fi

echo "PMO Orquestrador pronto. Aguardando comandos..."

# Mantém container vivo
exec "$@"