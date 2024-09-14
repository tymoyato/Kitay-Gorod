/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/uninstall.sh)"

sudo rm -rf /opt/homebrew/Frameworks/
sudo rm -rf /opt/homebrew/bin/
sudo rm -rf /opt/homebrew/etc/
sudo rm -rf /opt/homebrew/include/
sudo rm -rf /opt/homebrew/lib/
sudo rm -rf /opt/homebrew/opt/
sudo rm -rf /opt/homebrew/sbin/
sudo rm -rf /opt/homebrew/share/
sudo rm -rf /opt/homebrew/var/

# Remove the /opt/homebrew directory itself
sudo rm -rf /opt/homebrew/

