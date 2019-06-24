rem /**********  docker pus **********/
cd ..
cd boot-auth
call mvn dockerfile:push -f pom.xml

cd ..
cd boot-config
call mvn dockerfile:push -f pom.xml


cd ..
cd boot-eureka
call mvn dockerfile:push -f pom.xml

cd ..
cd boot-gateway
call mvn dockerfile:push -f pom.xml

cd ..
cd boot-modules/boot-activiti
call mvn dockerfile:push -f pom.xml

cd .. && cd ..
cd boot-upms/boot-upms-server
call mvn dockerfile:push -f pom.xml