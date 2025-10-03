# Build Automation Script

> A lightweight Bash automation script for managing build processes with version control, file copying, and sensitive data protection.

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![Shell](https://img.shields.io/badge/Shell-Bash%2FZsh-green.svg)](https://www.gnu.org/software/bash/)

## Table of Contents

- [Overview](#overview)
- [Features](#features)
- [Prerequisites](#prerequisites)
- [Installation](#installation)
- [Usage](#usage)
  - [Quick Start](#quick-start)
  - [For Bash](#for-bash)
  - [For Zsh](#for-zsh)
- [How It Works](#how-it-works)
- [Project Structure](#project-structure)
- [Configuration](#configuration)
- [Example Output](#example-output)
- [Troubleshooting](#troubleshooting)
- [Contributing](#contributing)
- [License](#license)

## Overview

This script automates the build process for projects by intelligently copying source files to a build directory while maintaining version control and security best practices. It's designed to be simple, safe, and shell-agnostic.

**Key capabilities:**
- 📋 Automatic version detection from changelog
- 🔒 Sensitive file exclusion (prevents accidental exposure)
- ✅ Interactive build confirmation
- 📦 Clean build directory management
- 🎯 Cross-shell compatibility (Bash & Zsh)

## Features

- ✅ **Version Detection** - Automatically extracts version from `source/changelog.md`
- ✅ **Interactive Confirmation** - Prompts user before building to prevent accidents
- ✅ **Security Filtering** - Excludes sensitive files (like `secretinfo.md`) from builds
- ✅ **Input Validation** - Handles invalid user input gracefully
- ✅ **Build Management** - Creates and manages build directory automatically
- ✅ **Build Summary** - Lists all files included in the build
- ✅ **Cross-Shell Support** - Works seamlessly with Bash and Zsh## Prerequisites

- **Shell**: Bash 3.0+ or Zsh 5.0+
- **OS**: macOS, Linux, or WSL (Windows Subsystem for Linux)
- **Required Files**:
  - `source/` directory with your source files
  - `source/changelog.md` with version on first line (format: `# Version X.X.X`)

## Installation

1. **Clone or download** this repository:
   ```bash
   git clone <your-repo-url>
   cd bash_automation
   ```

2. **Set up your source files**:
   ```bash
   # Ensure your source directory exists
   mkdir -p source
   
   # Create a changelog with version information
   echo "# Version 1.0.0" > source/changelog.md
   ```

3. **Make the script executable**:
   ```bash
   chmod +x script.sh
   ```

## Usage

### Quick Start

Run the build script with a single command:

```bash
./script.sh
```

The script will:
1. Display the detected version from your changelog
2. Ask for confirmation before proceeding
3. Copy all source files to the `build/` directory (excluding sensitive files)
4. Show a summary of the build contents

### For Bash

```bash
# Method 1: Direct execution (if executable)
./script.sh

# Method 2: Explicit bash invocation
bash script.sh
```

### For Zsh

```bash
# Method 1: Direct execution (if executable)
./script.sh

# Method 2: Run with bash (recommended for compatibility)
bash script.sh

# Method 3: Run with zsh
zsh script.sh
```

## How It Works

The build automation script follows a simple, secure workflow:

### 1. Version Detection
- Reads the first line of `source/changelog.md`
- Extracts version number using string parsing
- Displays version to user for confirmation

### 2. User Confirmation
- Prompts user: "Do you want to continue? (enter '1' for yes, '0' for no)"
- Validates input (only accepts `1` or `0`)
- Exits gracefully on invalid input or user decline

### 3. File Processing
- Iterates through all files in `source/` directory
- **Security check**: Skips `source/secretinfo.md` to prevent sensitive data exposure
- Creates `build/` directory if it doesn't exist
- Copies each non-sensitive file to `build/`

### 4. Build Summary
- Changes to `build/` directory
- Lists all copied files
- Displays build version for verification

## Project Structure

```
bash_automation/
├── LICENSE              # MIT License
├── README.md            # This file
├── script.sh            # Main build automation script
├── .gitignore           # Git ignore rules
├── source/              # Source files directory
│   ├── changelog.md     # Version information (REQUIRED)
│   ├── secretinfo.md    # Sensitive file (excluded from build)
│   ├── bar.js           # Example source files
│   ├── buzz.css
│   ├── foo1.html
│   ├── foo2.html
│   └── foo3.html
└── build/               # Generated build directory (gitignored)
    ├── changelog.md     # Copied files
    ├── bar.js
    ├── buzz.css
    ├── foo1.html
    ├── foo2.html
    └── foo3.html
```

## Configuration

### Changelog Format

Your `source/changelog.md` must start with a version line:

```markdown
# Version 1.2.3
## Changes
- Feature A
- Bug fix B
```

### Excluding Files from Build

To exclude additional files, modify the condition in `script.sh`:

```bash
if [ $filename == "source/secretinfo.md" ] || [ $filename == "source/another-file.md" ]
then
  echo "Not copying $filename with sensitive info"
fi
```

## Example Output

```bash
$ ./script.sh
🔥🔥🔥Beginning build!! 🔥🔥🔥
You are building version 1.2.3
Do you want to continue? (enter "1" for yes, "0" for no)
1
OK
source/bar.js
Copying source/bar.js
source/buzz.css
Copying source/buzz.css
source/changelog.md
Copying source/changelog.md
source/foo1.html
Copying source/foo1.html
source/foo2.html
Copying source/foo2.html
source/foo3.html
Copying source/foo3.html
source/secretinfo.md
Not copying source/secretinfo.md with sensitive info
Build version 1.2.3 contains:
bar.js
buzz.css
changelog.md
foo1.html
foo2.html
foo3.html
```

## Troubleshooting

### Issue: "Permission denied" error

**Solution**: Make the script executable
```bash
chmod +x script.sh
```

### Issue: "No such file or directory: source/changelog.md"

**Solution**: Create the required changelog file
```bash
mkdir -p source
echo "# Version 1.0.0" > source/changelog.md
```

### Issue: Version shows as empty or incorrect

**Problem**: Changelog format is incorrect  
**Solution**: Ensure first line of `source/changelog.md` matches: `# Version X.X.X`

```bash
# Correct format
echo "# Version 1.0.0" > source/changelog.md

# Verify
head -n 1 source/changelog.md
```

### Issue: Script runs on wrong shell

**Solution**: Explicitly specify bash interpreter
```bash
bash script.sh
```

### Issue: Build directory not created

**Solution**: Check write permissions in project directory
```bash
ls -la | grep bash_automation
chmod u+w .  # Grant write permission if needed
```

## Contributing

Contributions are welcome! Here's how you can help:

1. **Fork** the repository
2. **Create** a feature branch (`git checkout -b feature/amazing-feature`)
3. **Commit** your changes (`git commit -m 'Add some amazing feature'`)
4. **Push** to the branch (`git push origin feature/amazing-feature`)
5. **Open** a Pull Request

### Ideas for Contributions

- Add support for custom exclude patterns (regex or glob)
- Implement logging to a build log file
- Add timestamp to build directory names
- Support for multiple build configurations
- Add pre/post-build hooks
- Create a config file for settings

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

**MIT License Summary:**
- ✅ Commercial use
- ✅ Modification
- ✅ Distribution
- ✅ Private use
- ❌ Liability
- ❌ Warranty

---

**Made with ❤️ for build automation**

*Need help? Open an issue or contribute to make this tool better!*