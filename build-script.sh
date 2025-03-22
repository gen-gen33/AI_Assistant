# プロジェクトのルートディレクトリを設定
PROJECT_ROOT="."
SRC_DIR="${PROJECT_ROOT}/src"
LIB_DIR="${PROJECT_ROOT}/lib"  # ライブラリディレクトリを定義
CONFIG_DIR="${PROJECT_ROOT}/config"
BUILD_DIR="${PROJECT_ROOT}/build"
BIN_DIR="${PROJECT_ROOT}/bin"

# ImageJ JARのパスを更新
IMAGEJ_JAR="${LIB_DIR}/ij.jar"

# 必要なディレクトリの確認
if [ ! -f "$IMAGEJ_JAR" ]; then
    echo "Error: ImageJ jar file not found: $IMAGEJ_JAR"
    echo "Please ensure the JAR file exists in the lib directory."
fi

# コンパイル - ローカルのjarを使用
echo "Compiling..."
javac -source 1.8 -target 1.8 -classpath "$IMAGEJ_JAR" -d "$BIN_DIR" "${SRC_DIR}/AI_Assistant.java"
