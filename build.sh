# Removals
rm -rf device/xiaomi/blossom

# Initialize repo with specified manifest
repo init --depth=1 --no-repo-verify --git-lfs -u https://github.com/ProjectInfinity-X/manifest -b 15 -g default,-mips,-darwin,-notdefault

# Clone device tree
git clone https://github.com/Voltage-Beryllium/dt_blossom.git -b inf device/xiaomi/blossom

# Sync the repositories
/opt/crave/resync.sh && /opt/crave/resync.sh

# Set up build environment
source build/envsetup.sh

# Lunch configuration
lunch infinity_blossom-userdebug

# Git-lfs
repo forall -c 'git lfs install && git lfs pull && git lfs checkout'

# Build
mka bacon
