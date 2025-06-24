#!/bin/sh

# 自动下载 Gradle 的便携式脚本
# -----------------------------
BASE_DIR="$(cd "$(dirname "$0")" && pwd)"
GRADLE_VERSION="8.3"
GRADLE_ZIP_URL="https://services.gradle.org/distributions/gradle-${GRADLE_VERSION}-bin.zip"
GRADLE_DIR="${BASE_DIR}/gradle-${GRADLE_VERSION}"

# 如果未安装则下载
if [ ! -d "$GRADLE_DIR" ]; then
    echo "下载 Gradle ${GRADLE_VERSION}..."
    curl -L "$GRADLE_ZIP_URL" -o gradle.zip
    unzip -q gradle.zip
    rm gradle.zip
fi

# 执行构建
exec "${GRADLE_DIR}/bin/gradle" "$@"
