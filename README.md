# Qwen Local Backup

This directory contains common files that can be used across multiple projects with Qwen Code.

## Files Included

1. `QWEN.md` - A sample Qwen.md file with backup instructions
2. `session_start.sh` - A script to run at the beginning of each session
3. `scripts/backup_project.sh` - The backup script that creates timestamped backups

## How to Use

1. Copy these files to your project root:
   ```bash
   cp -r qwen-common/* /path/to/your/project/
   ```

2. Make the scripts executable:
   ```bash
   chmod +x session_start.sh
   chmod +x scripts/backup_project.sh
   ```

3. Run the session start script to create your first backup:
   ```bash
   ./session_start.sh
   ```

## Customization

You may want to customize the following in the backup script:

1. Exclusion patterns in the `zip` command to match your project's needs
2. The number of backups to retain (currently set to 5)
3. The backup directory name (currently `.bak`)

The scripts are designed to be self-contained and should work with most project structures.
