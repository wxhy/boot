rem /**********  docker pus **********/
cd ..
cd boot-auth
dockerfile:push -f pom.xml

cd ..
cd boot-config
dockerfile:push -f pom.xml


cd ..
cd boot-eureka
dockerfile:push -f pom.xml

cd ..
cd boot-gateway
dockerfile:push -f pom.xml

cd ..
cd boot-modules/boot-activiti
dockerfile:push -f pom.xml

cd .. && cd ..
cd boot-upms/boot-upms-server
dockerfile:push -f pom.xml