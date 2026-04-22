.PHONY: up down logs shell-pmo test-agent clean

up:
	docker-compose up -d postgres redis kimi-orchestrator
	@echo "Aguardando inicialização..."
	sleep 5
	docker-compose logs kimi-orchestrator | tail -20

up-agents:
	docker-compose --profile agents up -d

up-mcp:
	docker-compose --profile mcp up -d

down:
	docker-compose down -v

shell-pmo:
	docker exec -it artico-pmo /bin/bash

# Executa um ciclo TDD completo via PMO
run-cycle:
	docker exec artico-pmo kimi-agent execute-cycle --spec /workspace/docs/feature.md

logs:
	docker-compose logs -f kimi-orchestrator

# Limpeza segura (mantém código, remove logs)
clean:
	docker-compose down
	docker volume rm artico-ai-agents_redis-data artico-ai-agents_dev-cache || true