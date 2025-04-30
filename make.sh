#!/usr/bin/env bash

# 保存工作目录
WORK_DIR=$(pwd)

# 定义打包函数
package_extensions() {
    echo "Packaging extensions..."
    cd $WORK_DIR/core-pack/ && vsce package
    cd $WORK_DIR/ai-pack/ && vsce package
    cd $WORK_DIR/document-pack/ && vsce package
    cd $WORK_DIR/java-pack/ && vsce package
    cd $WORK_DIR/python-pack/ && vsce package
    cd $WORK_DIR/web-pack/ && vsce package
    cd $WORK_DIR/extra-pack/ && vsce package
    cd $WORK_DIR
    echo "Packaging complete."
}

# 定义安装函数
install_extensions() {
    echo "Installing extensions..."
    cd $WORK_DIR/core-pack/ && code --install-extension *.vsix --force
    cd $WORK_DIR/ai-pack/ && code --install-extension *.vsix --force
    cd $WORK_DIR/document-pack/ && code --install-extension *.vsix --force
    cd $WORK_DIR/java-pack/ && code --install-extension *.vsix --force
    cd $WORK_DIR/python-pack/ && code --install-extension *.vsix --force
    cd $WORK_DIR/web-pack/ && code --install-extension *.vsix --force
    cd $WORK_DIR/extra-pack/ && code --install-extension *.vsix --force
    cd $WORK_DIR
    echo "Installation complete."
}

# 定义发布函数
publish_extensions() {
    echo "Publishing extensions..."
    cd $WORK_DIR/core-pack/ && vsce publish
    cd $WORK_DIR/ai-pack/ && vsce publish
    cd $WORK_DIR/document-pack/ && vsce publish
    cd $WORK_DIR/java-pack/ && vsce publish
    cd $WORK_DIR/python-pack/ && vsce publish
    cd $WORK_DIR/web-pack/ && vsce publish
    cd $WORK_DIR/extra-pack/ && vsce publish
    cd $WORK_DIR
    echo "Publishing complete."
}

# 根据参数执行操作
case "$1" in
    install)
        install_extensions
        ;;
    publish)
        publish_extensions
        ;;
    package|*)
        package_extensions
        ;;
esac
