name: Java CI

on: [push]

jobs:
  build:
    runs-on: ubuntu-latest

    steps:
    - uses: actions/checkout@v4

    # 设置Gradle环境，并指定Gradle版本
    - name: Setup Gradle
      uses: gradle/gradle-build-action@v3
      with:
        gradle-version: 8.4

    - name: Set up JDK 17
      uses: actions/setup-java@v4
      with:
        java-version: '17'
        distribution: 'temurin'

    # 构建
    - name: Build
      run: gradle build
