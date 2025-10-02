# Build Automation Script

## Purpose
This script automates the build process for a project by:
- Reading version information from a changelog
- Copying source files to a build directory
- Handling sensitive files by excluding them from the build
- Providing user confirmation before proceeding

## Features
- ✅ Version detection from `source/changelog.md`
- ✅ Interactive build confirmation
- ✅ Selective file copying with security filtering
- ✅ Build directory management
- ✅ Build contents listing

## Prerequisites
- Source files in `source/` directory
- `source/changelog.md` file with version on first line (format: `# Version X.X.X`)

## Usage

### For Bash
```bash
# Make executable
chmod +x script.sh

# Run the script
./script.sh
```

### For Zsh
```bash
# Method 1: Run with bash (recommended)
bash script.sh

# Method 2: Run with zsh
zsh script.sh

# Method 3: Make executable and run
chmod +x script.sh
./script.sh
```

## How It Works

1. **Version Detection**: Reads the first line of `source/changelog.md` to extract version number
2. **User Confirmation**: Prompts user to confirm build (enter "1" for yes, "0" for no)
3. **File Processing**: 
   - Copies all files from `source/` to `build/`
   - Skips `source/secretinfo.md` for security
4. **Build Summary**: Lists contents of the build directory

## File Structure
```
bash_automation/
├── script.sh          # Main automation script
├── source/            # Source files directory
│   ├── changelog.md   # Version information (required)
│   ├── secretinfo.md  # Sensitive file (excluded from build)
│   └── ...           # Other source files
└── build/            # Generated build directory
    └── ...           # Copied files (excluding sensitive ones)
```

## Example Output
```
🔥🔥🔥Beginning build!! 🔥🔥🔥
You are building version 1.2.3
Do you want to continue? (enter "1" for yes, "0" for no)
1
OK
source/changelog.md
Copying source/changelog.md
source/secretinfo.md
Not copying source/secretinfo.md with sensitive info
Build version 1.2.3 contains:
changelog.md
```

## Notes
- The script is compatible with both bash and zsh shells
- Sensitive files (like `secretinfo.md`) are automatically excluded from builds
- The build directory is created automatically if it doesn't exist
- Invalid input handling prevents accidental builds