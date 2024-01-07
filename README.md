docker build -t react-docker-image .

docker run -rm -d -p 5000:80 --name react-docker-image-name react-docker-image