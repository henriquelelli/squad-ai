FROM python:3.11-slim

# Ferramentas SAST e linting
RUN pip install --no-cache-dir \
    bandit \
    semgrep \
    pylint \
    safety \
    kimi-cli

# Regras customizadas para código financeiro
COPY rules/ /opt/rules/

WORKDIR /workspace
CMD ["tail", "-f", "/dev/null"]