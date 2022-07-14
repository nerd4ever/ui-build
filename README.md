# Imagem para build de projetos em Angular

Serviço com suporte a SSH para build remoto de projetos que dependem de nodejs e npm

> Essa imagem iniciar um servidor SSH, isso pode deixar sua rede vunerável

Docker composer example
````
version: "2.0"
services:
  build_ui:
    image: nerd4ever/build-ui:latest
    volumes:
      - build_ui_volume:/workspace
    ports:
      - "15022:22"
volumes:
  build_ui_volume:
````

Command line example
````
docker run -d -p 15022:22 --name build_ui --restart=always nerd4ever/build-ui:latest
````
