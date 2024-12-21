REM filepath: /shared/git/devel/qotd-client/compile.bat
@echo off
set GOOS=linux
set GOARCH=amd64
echo "Building qotd-client binary..."
go build -o qotd-client main.go
if not exist "debian\usr\local\bin" mkdir "debian\usr\local\bin"
echo "Copying qotd-client binary to debian directory..."
copy qotd-client debian\usr\local\bin\

REM Crea una nuova directory temporanea in ~
echo "Creating temporary directory for debian package..."
wsl bash -c "rm -rf ~/qotd-client-temp && mkdir -p ~/qotd-client-temp && cp -r /shared/git/devel/qotd-client/debian ~/qotd-client-temp/ && chmod -R 755 ~/qotd-client-temp/debian/DEBIAN && cd ~/qotd-client-temp && dpkg-deb --build debian qotd-client_1.0_amd64.deb"

REM Crea la directory release se non esiste e copia il pacchetto .deb
if not exist "release" mkdir "release"
echo "Copying debian package to release directory..."
wsl bash -c "cp ~/qotd-client-temp/qotd-client_1.0_amd64.deb /shared/git/devel/qotd-client/release/"

REM Pulisce la directory temporanea
echo "Cleaning up temporary directory..."
wsl bash -c "rm -rf ~/qotd-client-temp"

REM Esegui lo script temporaneo all'interno del container Docker
echo "Running apk_util.sh inside Docker container..."
wsl bash -c "sudo docker run --rm -v /shared/git/devel/qotd-client:/qotd-client -w /qotd-client alpine sh /qotd-client/apk_util.sh"

REM Pulisce la directory temporanea
echo "Cleaning up apk temporary directory..."
wsl bash -c "rm -rf ~/qotd-client-apk-temp"