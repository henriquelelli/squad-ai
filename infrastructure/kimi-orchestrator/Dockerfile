FROM python:3.11-slim

# Instala dependências do sistema
RUN apt-get update && apt-get install -y \
    git \
    curl \
    jq \
    docker.io \
    && rm -rf /var/lib/apt/lists/*

# Instala Kimi Code CLI
RUN pip install --no-cache-dir kimi-cli

# Instala Agente SDK do Kimi (se disponível publicamente, senão usa CLI)
# RUN pip install kimi-agent-sdk

# Configura diretório de trabalho
WORKDIR /workspace

# Script de entrada que mantém o container vivo e escuta Redis para tasks
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
CMD ["kimi", "--version"]