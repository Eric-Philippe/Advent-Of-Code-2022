#!/bin/bash
find . -name "node_modules" -type d -exec rm -rf {} \;
find . -name "__pycache__" -type d -exec rm -rf {} \;
find . -name "out" -type d -exec rm -rf {} \;
find . -name "bin" -type d -exec rm -rf {} \;
find . -name "obj" -type d -exec rm -rf {} \;
find . -name "dist" -type d -exec rm -rf {} \;