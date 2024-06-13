#!/bin/zsh

# Function to check and install dependencies
install_dependency() {
    local dep=$1
    local install_cmd=$2

    if ! command -v $dep &> /dev/null
    then
        echo "$dep could not be found, installing..."
        eval $install_cmd
    else
        echo "$dep is already installed."
    fi
}

# Update package list
sudo apt-get update

# Install toilet
install_dependency "toilet" "sudo apt-get install -y toilet"

# Install Go (required for installing Go-based tools)
install_dependency "go" "sudo apt-get install -y golang"

# Ensure GOPATH is set
if [ -z "$GOPATH" ]; then
    export GOPATH=$HOME/go
    echo 'export GOPATH=$HOME/go' >> ~/.zshrc
    echo 'export PATH=$PATH:$GOPATH/bin' >> ~/.zshrc
    export PATH=$PATH:$GOPATH/bin
else
    export PATH=$PATH:$GOPATH/bin
fi

# Source the updated .zshrc to reflect GOPATH changes
source ~/.zshrc

# Install qsreplace using go install
install_dependency "qsreplace" "go install github.com/tomnomnom/qsreplace@latest"

# Install waybackurls using go install
install_dependency "waybackurls" "go install github.com/tomnomnom/waybackurls@latest"

# Install curl
install_dependency "curl" "sudo apt-get install -y curl"

# Install grep (typically pre-installed on most Unix systems)
install_dependency "grep" "sudo apt-get install -y grep"

chmod +x wrongturn.sh

echo "Installation complete. You can now run the tool using ./wrongturn.sh"
