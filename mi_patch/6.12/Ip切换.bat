@echo off
:: 检查管理员权限
fltmc >nul 2>&1 || (echo 请以管理员身份运行 & pause >nul & exit /b)

title USB网卡IP切换工具
color 0A
echo 请通过 "netsh interface show interface" 确认网卡名称，当前使用：USB
set "NIC_NAME=USB" & echo.

:menu
cls
echo ================================
echo    USB网卡IP切换工具
echo ================================
echo 1. 设置静态IP  2. 自动获取(DHCP)  3. 退出
set /p "choice=请选择 [1/2/3]："

if "%choice%"=="1" (
    echo 设置静态IP...
    netsh interface ip set address "%NIC_NAME%" static 192.168.1.100 255.255.255.0 192.168.1.1 1 >nul 2>&1 && (
        echo 静态IP设置成功：
        echo   IP: 192.168.1.100  子网: 255.255.255.0  网关: 192.168.1.1
    ) || echo 静态IP设置失败，请检查网卡名称
) else if "%choice%"=="2" (
    echo 切换至DHCP...
    ipconfig /release "%NIC_NAME%" >nul 2>&1
    (netsh interface ip set address "%NIC_NAME%" dhcp >nul 2>&1 && netsh interface ip set dns "%NIC_NAME%" dhcp >nul 2>&1) && (
        ipconfig /renew "%NIC_NAME%" >nul 2>&1
        echo DHCP设置成功，正在获取IP...
    ) || echo DHCP设置失败
) else if "%choice%"=="3" exit /b else (
    echo 无效选择，请重新输入
)

echo. & echo 操作完成，按任意键返回... & pause >nul & goto menu