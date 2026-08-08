@echo off
chcp 65001 >nul
:: 检查管理员权限，如果不是则自动提权
net session >nul 2>&1
if %errorlevel% neq 0 (
    echo 正在请求管理员权限...
    powershell -Command "Start-Process '%~f0' -Verb RunAs"
    exit /b
)

echo 重启 VMAuthdService 服务...

:: 停止服务
net stop VMAuthdService /y

:: 启动服务
net start VMAuthdService

echo VMAuthdService 服务已重启完成。

