#!/usr/bin/env bash

# 保存工作目录
WORK_DIR=$(pwd)

cd $WORK_DIR/core-pack/
vsce package
code --install-extension *.vsix
# vsce publish

cd $WORK_DIR/ai-pack/
vsce package
code --install-extension *.vsix
# vsce publish

cd $WORK_DIR/java-pack/
vsce package
code --install-extension *.vsix
# vsce publish

cd $WORK_DIR/python-pack/
vsce package
code --install-extension *.vsix
# vsce publish

cd $WORK_DIR/document-pack/
vsce package
code --install-extension *.vsix
# vsce publish

cd $WORK_DIR/extra-pack/
vsce package
code --install-extension *.vsix
# vsce publish

cd $WORK_DIR
