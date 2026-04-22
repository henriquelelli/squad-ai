FROM python:3.11-slim

# Stack completa de desenvolvimento
RUN pip install --no-cache-dir \
    black \
    isort \
    mypy \
    kimi-cli \
    requests \
    pandas \
    numpy

# Pre-commit hooks para padronização
RUN pip install pre-commit

WORKDIR /workspace
CMD ["tail", "-f", "/dev/null"]