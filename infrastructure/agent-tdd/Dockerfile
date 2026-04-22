FROM python:3.11-slim

# Ferramentas de teste
RUN pip install --no-cache-dir \
    pytest \
    pytest-cov \
    pytest-asyncio \
    hypothesis \
    kimi-cli  # Para gerar testes via IA

WORKDIR /workspace
# O agente recebe comandos via Docker exec do PMO
CMD ["tail", "-f", "/dev/null"]