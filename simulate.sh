#!/usr/bin/env bash

set -e

BLUE='\033[0;34m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m'

echo -e "${BLUE}"
cat << "BANNER"
   ╔═╗╦ ╦╔═╗╔═╗╔═╗  ╔═╗╔═╗╔═╗
   ║ ╦║ ║║ ║║ ║╚═╗  ║ ║╠═╣║╣ 
   ╚═╝╚═╝╚═╝╚═╝╚═╝  ╚═╝╩ ╩╚═╝
   
   LEDGER - Blockchain Voting Simulation
BANNER
echo -e "${NC}"

SIM_DIR="/tmp/vsp-ledger"
PROJECT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo -e "${YELLOW}>> Initializing Ledger in ${SIM_DIR}...${NC}"

rm -rf "$SIM_DIR"
mkdir -p "$SIM_DIR"
cp -r "$PROJECT_DIR"/* "$SIM_DIR/"
cd "$SIM_DIR"

echo -e ">> Building Docker images..."
if command -v docker-compose &> /dev/null; then
    docker-compose -p vsp-ledger up --build -d
else
    docker compose -p vsp-ledger up --build -d
fi

echo -e "\n${GREEN}✔ Ledger Successfully Simulated!${NC}"
echo -e "================================================================================="
echo -e "🌍 ${BLUE}Voting Web UI${NC}:  http://localhost:3000"
echo -e "🔌 ${BLUE}API${NC}:             http://localhost:3001"
echo -e "⛓️ ${BLUE}Blockchain${NC}:        http://localhost:8545"
echo -e ""
echo -e "🛑 To teardown: cd $SIM_DIR && docker compose -p vsp-ledger down"
echo -e "================================================================================="
