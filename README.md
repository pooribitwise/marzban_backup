# marzban backup script (sqlite version

## Usage:
1. Create a copy of config.env.example to config.env:
```bash
cp config.env.example config.env
```
2. Edit the enviromental variables:
```bash
# replace USER with your user which has privilage to your files
# replace HOST with your server's ip
SERVER="USER@HOST"
# replace PATH_TO_SSH_KEY with your private ssh key which can login to your server
SSH_KEY="PATH_TO_SSH_KEY"
# replace 22 with your configured ssh port if you are using any ports other than 22
SSH_PORT="22"
# backup directory can be configured in the main backup.sh
```
3. Give the script executable permission:
```bash
chmod +x backup.sh
```
4. Run the script:
```bash
./backup.sh
```
