@echo off
echo ===================================
echo Starting Microservices
echo ===================================

cd /d %~dp0

echo Starting Eureka Server...
start "Eureka Server" java -jar eureka-server\target\eureka-server-0.0.1-SNAPSHOT.jar

echo Waiting for Eureka to start...
timeout /t 10

echo Starting Gateway...
start "Gateway" java -jar gateway\target\gateway-0.0.1-SNAPSHOT.jar

echo Waiting for Gateway to start...
timeout /t 5

echo Starting User Service...
start "User Service" java -jar user-service\target\user-service-0.0.1-SNAPSHOT.jar

echo ===================================
echo All services started successfully
echo ===================================

pause
