rem /**********  docker pus **********/
cd ..
cd boot-auth
mvn dockerfile:build -f pom.xml

cd ..
cd boot-config
mvn dockerfile:build -f pom.xml


cd ..
cd boot-eureka
mvn dockerfile:build -f pom.xml

cd ..
cd boot-gateway
mvn dockerfile:build -f pom.xml

cd ..
cd boot-modules/boot-activiti
mvn dockerfile:build -f pom.xml

cd .. && cd ..
cd boot-upms/boot-upms-server
mvn dockerfile:build -f pom.xml

