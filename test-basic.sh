#!/bin/bash
# Basic smoke test for opencode-resume

echo "=== Testing opencode-resume ==="
echo ""

echo "Test 1: No arguments (should show usage)"
node dist/index.js
echo ""

echo "Test 2: Help message check"
if node dist/index.js 2>&1 | grep -q "Usage: opencode-resume"; then
  echo "✅ Usage message displayed correctly"
else
  echo "❌ Usage message not found"
  exit 1
fi
echo ""

echo "Test 3: Check if built files exist"
if [ -f "dist/index.js" ] && [ -f "dist/server.js" ] && [ -f "dist/search.js" ]; then
  echo "✅ All built files present"
else
  echo "❌ Missing built files"
  exit 1
fi
echo ""

echo "Test 4: Check executable permissions"
if [ -x "dist/index.js" ]; then
  echo "✅ index.js is executable"
else
  echo "❌ index.js is not executable"
  exit 1
fi
echo ""

echo "=== All basic tests passed! ==="
echo ""
echo "To test with a real session, run:"
echo "  npx . \"test-session\""
echo ""
echo "Or use the alias:"
echo "  source ~/.zshrc"
echo "  o \"test-session\""
