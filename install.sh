#!/usr/bin/env bash
set -euo pipefail

# APIndex Quick Install Script
# Usage: curl -fsSL https://raw.githubusercontent.com/APIndex/apindex/main/install.sh | bash

INSTALL_DIR="${APINDEX_INSTALL_DIR:-./apindex}"
REPO_URL="https://raw.githubusercontent.com/APIndex/apindex/main"

echo "==> Installing APIndex to ${INSTALL_DIR}"

# Check prerequisites
if ! command -v docker &>/dev/null; then
  echo "Error: Docker is not installed. Install it from https://docs.docker.com/get-docker/"
  exit 1
fi

if ! docker compose version &>/dev/null; then
  echo "Error: Docker Compose V2 is required. Update Docker or install the compose plugin."
  exit 1
fi

# Create directory
mkdir -p "$INSTALL_DIR"
cd "$INSTALL_DIR"

# Download files
echo "==> Downloading configuration files..."
curl -fsSL "${REPO_URL}/docker-compose.yml" -o docker-compose.yml
curl -fsSL "${REPO_URL}/.env.example" -o .env.example

# Create .env if it doesn't exist
if [ ! -f .env ]; then
  cp .env.example .env
  # Generate a random secret key
  SECRET_KEY=$(openssl rand -base64 32 2>/dev/null || head -c 32 /dev/urandom | base64)
  if [[ "$OSTYPE" == "darwin"* ]]; then
    sed -i '' "s|CHANGE-ME-generate-a-random-string|${SECRET_KEY}|" .env
  else
    sed -i "s|CHANGE-ME-generate-a-random-string|${SECRET_KEY}|" .env
  fi
  echo "==> Created .env file with generated secret key"
  echo "    IMPORTANT: Edit .env to set your admin email and password"
else
  echo "==> .env already exists, skipping"
fi

echo ""
echo "==> APIndex is ready!"
echo ""
echo "    1. Edit the configuration:"
echo "       cd ${INSTALL_DIR} && nano .env"
echo ""
echo "    2. Start APIndex:"
echo "       docker compose up -d"
echo ""
echo "    3. Open in your browser:"
echo "       http://localhost (or the PORT you configured)"
echo ""
echo "    Documentation: https://apindex.dev/docs"
echo ""
