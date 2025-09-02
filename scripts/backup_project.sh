#!/bin/bash

# Project Backup Script
# Creates a zipfile backup with datetime stamp and maintains only the latest 5 backups

# Create .bak directory if it doesn't exist
mkdir -p .bak

# Count all zip files in the backup directory
backup_count=$(ls -1 .bak/*.zip 2>/dev/null | wc -l)

# If there are 5 or more backups, delete the oldest ones to maintain only 5
if [ "$backup_count" -ge 5 ]; then
    # Calculate how many backups to delete
    delete_count=$((backup_count - 4))
    
    # Find the oldest backups and delete them
    ls -1t .bak/*.zip 2>/dev/null | tail -n "$delete_count" | while read -r file; do
        echo "Deleting old backup: $file"
        rm "$file"
    done
fi

# Create new backup with datetime stamp
timestamp=$(date +"%Y%m%d_%H%M%S")
backup_name="backup_$timestamp.zip"

echo "Creating backup: $backup_name"
zip -r ".bak/$backup_name" . -x "*/.git/*" "*.pyc" "__pycache__/*" ".bak/*" "logs/*" "data/*" "reports/*" "*/node_modules/*" "*.log" "scraper/data/*" "*/__pycache__/*" "*/.DS_Store" ".env" "venv/*" "env/*" "*/.pytest_cache/*" 2>/dev/null

echo "Backup completed: .bak/$backup_name"

# Show current backups
echo "Current backups in .bak folder:"
ls -la .bak/