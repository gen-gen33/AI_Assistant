#!/bin/bash
# Script to build the plugin

# プロジェクトのルートディレクトリを設定
PROJECT_ROOT="./"
SRC_DIR="${PROJECT_ROOT}/src"
CONFIG_DIR="${PROJECT_ROOT}/config"
BUILD_DIR="${PROJECT_ROOT}/build"
BIN_DIR="${PROJECT_ROOT}/bin"

# ImageJのパスを設定
IMAGEJ_PATH="$HOME/ImageJ"
IMAGEJ_JAR="$IMAGEJ_PATH/ij.jar"

# 必要なディレクトリの確認
if [ ! -f "$IMAGEJ_JAR" ]; then
    echo "Error: ImageJ jar file not found: $IMAGEJ_JAR"
    echo "Please set the IMAGEJ_PATH properly in the script."
fi

# 必要なディレクトリの作成
mkdir -p "$BIN_DIR"

# コンパイル - Java 8互換
echo "Compiling..."
javac -source 1.8 -target 1.8 -classpath "$IMAGEJ_JAR" -d "$BIN_DIR" "${SRC_DIR}/AI_Assistant.java"
if [ $? -ne 0 ]; then
    echo "Compilation failed."
fi

# JARファイル作成
echo "Creating JAR file..."
cd "$BIN_DIR"
jar cf "${BUILD_DIR}/AI_Assistant.jar" AI_Assistant.class
cd "$PROJECT_ROOT"
# plugins.configを追加
if [ -f "${CONFIG_DIR}/plugins.config" ]; then
    jar uf "${BUILD_DIR}/AI_Assistant.jar" -C "${CONFIG_DIR}" plugins.config
fi
if [ $? -ne 0 ]; then
    echo "Failed to create JAR file."
fi

# プラグインディレクトリにコピー
echo "Installing plugin..."
mkdir -p "$IMAGEJ_PATH/plugins"
cp "${BUILD_DIR}/AI_Assistant.jar" "$IMAGEJ_PATH/plugins/"
if [ $? -ne 0 ]; then
    echo "Failed to install plugin."
fi

echo "Build completed. Please restart ImageJ."
