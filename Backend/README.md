##  Cómo usar el Backend

1. Para construir el proyecto:
 ```bash
 ./mvnw clean package
 ```
2. Para correr el proyecto:
 ```bash
 ./mvnw spring-boot:run
 ```

## Cómo crear BD en Docker 
1. Construir una imagen en base al documento docker, ubicado en el directorio "docerAndDataBase"

```
docker build -t image-usei .
```

2. Crear un contenedor en base a la imagen

```
docker run -d -p 5433:5432 --name usei-cont image-usei
```

3. Para correr el docker YA creado

```
docker start usei-cont
```