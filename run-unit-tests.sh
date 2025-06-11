#!/bin/bash
set -e

echo "🔬 Running unit tests..."
# Example: Run pytest, JUnit, or any other test runner
# For Node.js
npm install
npm run test:unit

echo "✅ Unit tests passed."
