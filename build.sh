docker build --rm -t tborgato/centos-ssh:latest .
docker push tborgato/centos-ssh:latest
mvn test
