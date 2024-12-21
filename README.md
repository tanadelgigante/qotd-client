# Qotd Client

## Overview
**Qotd Client** è un client per il protocollo QOTD (Quote of the Day) scritto in Go. Si connette a un server QOTD per ottenere e visualizzare una citazione del giorno.

## Features
- **Protocollo QOTD**: Implementa il protocollo QOTD per ottenere citazioni del giorno.
- **Facile da usare**: Interfaccia a riga di comando semplice e intuitiva.
- **Leggero e veloce**: Scritto in Go per prestazioni ottimali.

## Application Information
- **Name**: QOTD Client
- **Version**: 1.0.0
- **Author**: @ilgigante77
- **Website**: [https://github.com/tanadelgigante/qotd-client](https://github.com/tanadelgigante/qotd-client)

## Getting Started

### Prerequisites
- Go 1.23+
- Docker (opzionale per il deployment containerizzato)

### Installation

1. **Clone the repository**:
    ```bash
    git clone https://github.com/tanadelgigante/qotd-client.git
    cd qotd-client
    ```

2. **Build the application**:
    ```bash
    go build -o qotd-client main.go
    ```

### Configuration

1. **Server Setup**:
   Assicurati di avere un server QOTD in esecuzione. Puoi utilizzare il progetto [quoted](https://github.com/tanadelgigante/quoted) per configurare un server QOTD.

### Running the Application

1. **Run Locally**:
    ```bash
    ./qotd-client -server <server_address>
    ```

2. **Using Docker**:
   Crea un Dockerfile per il client:
    ```dockerfile
    # Fase di build
    FROM golang:1.23.4 AS build

    WORKDIR /app

    # Copia i file go.mod e go.sum
    COPY go.mod .
    COPY go.sum .

    # Scarica le dipendenze del modulo
    RUN go mod download

    # Copia il resto del codice dell'applicazione
    COPY . .

    # Costruisce l'applicazione Go
    RUN go build -o qotd-client .

    # Fase di runtime
    FROM alpine:latest

    WORKDIR /app

    # Copia l'eseguibile dall'immagine di build
    COPY --from=build /app/qotd-client /app/qotd-client

    # Imposta i permessi di esecuzione sull'eseguibile
    RUN chmod +x /app/qotd-client

    # Comando di esecuzione dell'applicazione
    CMD ["./qotd-client", "-server", "<server_address>"]
    ```

   Build and run the Docker container:
    ```bash
    docker build -t qotd-client .
    docker run qotd-client
    ```

### Usage

#### Command Line
- **QOTD Request**:
    ```bash
    ./qotd-client -server <server_address>
    ```
    Response:
    ```
    "La citazione del giorno è..."
    ```

### Debugging

- Usa i log dell'applicazione per monitorare le connessioni e le risposte del server. Cerca messaggi `[INFO]` e `[DEBUG]` nell'output della console.

### Contributing
Le contribuzioni sono benvenute! Fai un fork del repository e invia pull request per miglioramenti o correzioni di bug.

### License
Questo progetto è concesso in licenza sotto la GPL 3.0 License. Vedi il file [LICENSE](LICENSE) per i dettagli.

### Disclaimer
Questo progetto è rilasciato "as-is" e l'autore non è responsabile per danni, errori o uso improprio.

## Contact
Per maggiori informazioni, visita [https://github.com/tanadelgigante/qotd-client](https://github.com/tanadelgigante/qotd-client).