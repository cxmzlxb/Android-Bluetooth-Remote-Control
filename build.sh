#!/bin/bash
# 构建项目的主脚本
./gradlew clean assembleDebug || {
    echo "构建失败，尝试备用方法..."
    # 如果标准方法失败，直接使用Gradle
    ./gradle-8.3/bin/gradle assembleDebug
}
