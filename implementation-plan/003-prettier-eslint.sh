#!/bin/bash

# Prettier + ESLint Setup for Midnight Project
# Run this from the tfst-midnight-auth directory

set -e  # Exit on error

echo "🎨 Setting up Prettier + ESLint for Midnight project..."
echo ""

# Check if we're in a Midnight project
if [ ! -f "package.json" ]; then
    echo "❌ Error: package.json not found. Run this script from your Midnight app directory."
    exit 1
fi

# 1. Install dependencies
echo "📦 Installing Prettier + ESLint dependencies..."
npm install -D \
    prettier \
    eslint \
    @typescript-eslint/parser \
    @typescript-eslint/eslint-plugin \
    eslint-config-prettier \
    eslint-plugin-prettier

echo ""
echo "✅ Dependencies installed"
echo ""

# 2. Create .prettierrc
echo "📝 Creating .prettierrc..."
cat > .prettierrc <<'EOF'
{
  "semi": true,
  "trailingComma": "es5",
  "singleQuote": true,
  "printWidth": 100,
  "tabWidth": 2,
  "arrowParens": "always"
}
EOF

echo "✅ .prettierrc created"
echo ""

# 3. Create .prettierignore
echo "📝 Creating .prettierignore..."
cat > .prettierignore <<'EOF'
# Dependencies
node_modules/

# Build outputs
dist/
build/

# Midnight-specific
contracts/managed/
.midnight/

# Environment
.env
.env.local

# Logs
*.log

# OS files
.DS_Store
EOF

echo "✅ .prettierignore created"
echo ""

# 4. Create .eslintrc.json
echo "📝 Creating .eslintrc.json..."
cat > .eslintrc.json <<'EOF'
{
  "parser": "@typescript-eslint/parser",
  "parserOptions": {
    "ecmaVersion": 2022,
    "sourceType": "module",
    "project": "./tsconfig.json"
  },
  "extends": [
    "eslint:recommended",
    "plugin:@typescript-eslint/recommended",
    "prettier"
  ],
  "plugins": ["@typescript-eslint", "prettier"],
  "rules": {
    "prettier/prettier": "error",
    "@typescript-eslint/no-unused-vars": ["error", { "argsIgnorePattern": "^_" }],
    "@typescript-eslint/explicit-function-return-type": "off",
    "@typescript-eslint/no-explicit-any": "warn"
  },
  "env": {
    "node": true,
    "es2022": true
  },
  "ignorePatterns": ["dist", "node_modules", "contracts/managed"]
}
EOF

echo "✅ .eslintrc.json created"
echo ""

# 5. Create .eslintignore
echo "📝 Creating .eslintignore..."
cat > .eslintignore <<'EOF'
node_modules/
dist/
contracts/managed/
.midnight/
*.config.js
EOF

echo "✅ .eslintignore created"
echo ""

# 6. Add npm scripts
echo "📝 Adding npm scripts to package.json..."

# Check if scripts already exist
if grep -q '"format":' package.json; then
    echo "⚠️  Format script already exists, skipping..."
else
    # Use Node.js to add scripts (safer than sed)
    node -e "
    const fs = require('fs');
    const pkg = JSON.parse(fs.readFileSync('package.json', 'utf8'));
    pkg.scripts = {
        ...pkg.scripts,
        'format': 'prettier --write \"src/**/*.ts\"',
        'format:check': 'prettier --check \"src/**/*.ts\"',
        'lint': 'eslint src/**/*.ts',
        'lint:fix': 'eslint src/**/*.ts --fix',
        'format:compact': 'compact format contracts/*.compact'
    };
    fs.writeFileSync('package.json', JSON.stringify(pkg, null, 2) + '\n');
    "
    echo "✅ npm scripts added"
fi

echo ""

# 7. Optional: Create VS Code settings
echo "📝 Creating .vscode/settings.json (optional)..."
mkdir -p .vscode

cat > .vscode/settings.json <<'EOF'
{
  "editor.defaultFormatter": "esbenp.prettier-vscode",
  "editor.formatOnSave": true,
  "editor.codeActionsOnSave": {
    "source.fixAll.eslint": "explicit"
  },
  "[typescript]": {
    "editor.defaultFormatter": "esbenp.prettier-vscode"
  },
  "[javascript]": {
    "editor.defaultFormatter": "esbenp.prettier-vscode"
  },
  "eslint.validate": ["javascript", "typescript"],
  "files.exclude": {
    "**/node_modules": true,
    "**/dist": true
  }
}
EOF

echo "✅ .vscode/settings.json created"
echo ""

# 8. Format all files
echo "🎨 Running initial format..."
npm run format
echo "✅ Files formatted"
echo ""

# 9. Run linting
echo "🔍 Running linter..."
npm run lint || echo "⚠️  Linting found issues (run 'npm run lint:fix' to auto-fix)"
echo ""

# Summary
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "✅ Prettier + ESLint setup complete!"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""
echo "📋 Available commands:"
echo "  npm run format          - Format TypeScript files"
echo "  npm run format:check    - Check formatting without changes"
echo "  npm run lint            - Run ESLint"
echo "  npm run lint:fix        - Auto-fix ESLint issues"
echo "  npm run format:compact  - Format Compact smart contracts"
echo ""
echo "💡 VS Code users:"
echo "  - Install 'Prettier - Code formatter' extension"
echo "  - Install 'ESLint' extension"
echo "  - Settings are already configured in .vscode/settings.json"
echo ""
echo "🎯 For Compact files (.compact):"
echo "  - Use: compact format contracts/<filename>.compact"
echo "  - Or: npm run format:compact"
echo ""
