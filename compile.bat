REM filepath: /N:/git/devel/qotd-client/compile.bat
@echo off
set GOOS=linux
set GOARCH=amd64
go build -o qotd-client main.go
if not exist "debian\usr\local\bin" mkdir "debian\usr\local\bin"
copy qotd-client debian\usr\local\bin\

REM Crea una nuova directory temporanea in ~
wsl bash -c "rm -rf ~/qotd-client-temp && mkdir -p ~/qotd-client-temp && cp -r /shared/git/devel/qotd-client/debian ~/qotd-client-temp/ && chmod -R 755 ~/qotd-client-temp/debian/DEBIAN && cd ~/qotd-client-temp && dpkg-deb --build debian qotd-client_1.0_amd64.deb"

REM Crea la directory release se non esiste e copia il pacchetto .deb
if not exist "release" mkdir "release"
wsl bash -c "cp ~/qotd-client-temp/qotd-client_1.0_amd64.deb /shared/git/devel/qotd-client/release/"

REM Pulisce la directory temporanea
wsl bash -c "rm -rf ~/qotd-client-temp"