#!/bin/bash
find . -name "node_modules" -type d -exec rm -rf {} \;
find . -name "__pycache__" -type d -exec rm -rf {} \;
find . -name "out" -type d -exec rm -rf {} \;