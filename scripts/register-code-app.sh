#!/bin/bash

# Check if an argument was provided
if [ $# -eq 0 ]; then
    echo "Usage: $0 <application_name>"
    echo "Example: $0 'Visual Studio Code'"
    exit 1
fi

APP_NAME="$1"

# Get the bundle ID using osascript
echo "Getting bundle ID for $APP_NAME..."
BUNDLE_ID=$(osascript -e "id of app \"$APP_NAME\"" 2>/dev/null)

if [ $? -ne 0 ] || [ -z "$BUNDLE_ID" ]; then
    echo "Error: Could not find application '$APP_NAME'"
    echo "Make sure the application name is correct and the app is installed"
    exit 1
fi

echo "Found bundle ID: $BUNDLE_ID"

# Define coding file extensions
# Programming languages
EXTENSIONS=(
    # Web (excluding HTML which is better in browser)
    # "html" "htm"  # Commented out - better to open in browser
    "css" "scss" "sass" "less"
    "js" "jsx" "ts" "tsx" "mjs" "cjs"
    "json" "jsonc" "json5"

    # Python
    "py" "pyw" "pyx" "pyi" "pyc" "pyd"

    # Ruby
    "rb" "erb" "rake" "gemspec"

    # PHP
    "php" "phtml" "php3" "php4" "php5" "php7" "phps"

    # Java/JVM
    "java" "class" "jar"
    "kt" "kts" "ktm"
    "scala" "sc"
    "groovy" "gvy" "gy" "gsh"
    "clj" "cljs" "cljc" "edn"

    # C/C++
    "c" "h" "cpp" "cc" "cxx" "c++" "hpp" "hh" "hxx" "h++"
    "m" "mm"

    # C#/.NET
    "cs" "csx" "vb" "fs" "fsi" "fsx"

    # Go
    "go" "mod" "sum"

    # Rust
    "rs" "rlib"

    # Swift
    "swift"

    # Shell/Scripts
    "sh" "bash" "zsh" "fish" "ksh"
    "ps1" "psm1" "psd1"
    "bat" "cmd"

    # Data/Config
    "xml" "yaml" "yml" "toml" "ini" "cfg" "conf" "properties"
    "env" "dockerignore" "gitignore" "editorconfig"

    # Documentation
    "md" "markdown" "rst" "txt" "adoc" "asciidoc"

    # SQL
    "sql" "sqlite" "sqlite3" "db"

    # R
    "r" "R" "Rmd" "Rnw"

    # Julia
    "jl"

    # Lua
    "lua"

    # Perl
    "pl" "pm" "pod" "t"

    # Elixir/Erlang
    "ex" "exs" "erl" "hrl"

    # Haskell
    "hs" "lhs"

    # Vim
    "vim" "vimrc"

    # Docker
    "dockerfile" "Dockerfile"

    # Make
    "makefile" "Makefile" "mk"

    # CMake
    "cmake"

    # Terraform
    "tf" "tfvars"

    # Misc
    "diff" "patch"
    "log"


# Register each extension with duti
echo "Registering file extensions..."
for ext in "${EXTENSIONS[@]}"; do
    echo -n "Registering .$ext... "
    duti -s "$BUNDLE_ID" ".$ext" all
    if [ $? -eq 0 ]; then
        echo "✓"
    else
        echo "✗ (failed)"
    fi
done

echo ""
echo "Done! All coding file types have been registered to open with $APP_NAME"
echo "Bundle ID: $BUNDLE_ID"
