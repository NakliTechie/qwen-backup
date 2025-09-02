#!/bin/bash

# Session Start Script
# Runs backup and other initialization tasks when starting a new session

echo "🚀 Starting new session..."

# Run project backup
echo "🔒 Creating project backup..."
./scripts/backup_project.sh

echo "✅ Session initialization complete!"