#!/bin/bash

# Define colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Default settings
NO_PAUSE=false

log_info() {
    echo -e "${BLUE}[INFO]${NC} $1"
}

log_success() {
    echo -e "${GREEN}[SUCCESS]${NC} $1"
}

log_warn() {
    echo -e "${YELLOW}[WARN]${NC} $1"
}

log_error() {
    echo -e "${RED}[ERROR]${NC} $1"
}

pause() {
    if [ "$NO_PAUSE" = false ]; then
        echo -e "\n${BLUE}Press any key to continue...${NC}"
        read -n 1 -s
    fi
}

backup_config() {
    local target_dir="$1"
    if [ -d "$target_dir" ]; then
        local timestamp=$(date +%Y%m%d_%H%M%S)
        local backup_dir="${target_dir}.bak.${timestamp}"
        log_warn "Existing configuration found at $target_dir"
        log_info "Backing up to $backup_dir"
        mv "$target_dir" "$backup_dir"
    fi
}

install_from_git() {
    local repo_url="$1"
    local target_dir="$2"
    local branch="${3:-master}" # Default to master if not provided
    local temp_dir="/tmp/autoarch-tmp-$(date +%s)"

    log_info "Cloning $repo_url (branch: $branch)..."
    git clone --branch "$branch" "$repo_url" "$temp_dir"

    if [ $? -ne 0 ]; then
        log_error "Failed to clone repository $repo_url"
        return 1
    fi

    backup_config "$target_dir"

    log_info "Installing new configuration to $target_dir..."
    mkdir -p "$target_dir"
    cp -r "$temp_dir"/* "$target_dir/"
    
    rm -rf "$temp_dir"
    log_success "Installation from $repo_url completed."
}
