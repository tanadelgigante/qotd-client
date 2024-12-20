GOOS=linux GOARCH=amd64 go build -o qotd-client main.go
cp qotd-client debian/usr/local/bin/
dpkg-deb --build debian qotd-client_1.0_amd64.deb