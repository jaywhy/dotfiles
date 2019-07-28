cd $HOME
tar -czvf ./OneDrive/Backup/Code/code-$(date '+%Y-%m-%d').tar.gz --exclude=node_modules code/
tar -czvf ./OneDrive/Backup/Settings/library-$(date '+%Y-%m-%d').tar.gz Library/Preferences Library/Application\ Support
tar -czvf ./OneDrive/Backup/Settings/config-$(date '+%Y-%m-%d').tar.gz .config/