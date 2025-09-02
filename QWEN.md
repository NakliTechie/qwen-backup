# Qwen Code Context

This is a sample Qwen.md file that can be used as a template for other projects. It includes backup instructions and references to the backup scripts.

## Backup Instructions
To ensure project safety, automatic backups are implemented with the following features:
1. Create a backup as a zipfile with datetime stamp on every session launch
2. Store backups in a `.bak` folder
3. Retain only the latest 5 backups

### Implementation Details
The backup system consists of two main scripts:

1. **Backup Script**: `scripts/backup_project.sh`
   - Creates a zipfile backup with datetime stamp in format: `backup_YYYYMMDD_HHMMSS.zip`
   - Stores backups in the `.bak` folder
   - Automatically maintains only the latest 5 backups by deleting older ones
   - Excludes unnecessary files and directories to keep backup size reasonable:
     - Git directory (`*/.git/*`)
     - Python cache files (`*.pyc`, `__pycache__/*`)
     - Backup directory itself (`.bak/*`)
     - Log files (`logs/*`, `*.log`)
     - Data directories (`data/*`)
     - Reports directory (`reports/*`)
     - Node modules (`*/node_modules/*`)
     - Environment files (`.env`, `venv/*`, `env/*`)
     - Pytest cache (`*/.pytest_cache/*`)
     - System files (`*/.DS_Store`)

2. **Session Start Script**: `session_start.sh`
   - Runs the backup script at the beginning of each session
   - Provides user-friendly output showing session start and backup progress
   - Can be executed manually or integrated into your development workflow

### Usage
To manually create a backup:
```bash
./scripts/backup_project.sh
```

To run backup on session start:
```bash
./session_start.sh
```

### How It Works
1. The backup script creates a `.bak` directory in the project root if it doesn't exist
2. On each execution:
   - Counts all existing zip files in the `.bak` folder
   - If there are 5 or more backups, deletes the oldest ones to maintain only 5:
     - Calculates how many backups to delete (total count - 4)
     - Sorts backups by modification time (newest first)
     - Deletes the oldest backups using `tail` to get the files to remove
   - Creates a new backup with current datetime stamp using `zip -r`
   - Stores the backup in the `.bak` folder
   - Shows current backups in the directory after completion