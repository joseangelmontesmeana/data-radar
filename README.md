# data-radar


## Introducción
data-radar es una API que permite obtener la localización de distintas infrastructuras situadas en la ciudad de Gijón.
Para ello hace uso, del catálogo de datos abiertos, que la propia ciudad proporciona a través del siguiente enlace:
[Catálogo](https://transparencia.gijon.es/page/1808-catalogo-de-datos)


## Entorno de producción

#### Prerrequisitos en  producción
- [Docker](https://www.docker.com/products/docker-desktop): Se debe disponer de una máquina con docker instalado.
- [MariaDB](https://go.mariadb.com/download-mariadb-server-community.html): La máquina debe tener acceso a una base de 
datos MariaDB.
- Además será necesario disponer de un fichero de variables de entorno [.env](https://github.com/joseangelmontesmeana/data-radar/blob/master/.example.production.env),
 en el cual se realizaran las distintas configuraciones.

###### Ejemplo .env producción
```
## Django DB connection
DB_NAME=radar_db    # (Nombre de la base de datos)
DB_USER=radar       # (Nombre de usuario en la base de datos)
DB_PASSWORD=radar   # (Password del usuario en base de datos)
DB_HOST=10.0.0.1    # (Host de la base de datos)
DB_PORT=3306        # (Puerto de la base de datos)

## ETL Setup
## Puedes no proporcionar la variable LOCAL_DATA. En este caso toma valor falso y los datos serán obtenidos del catálogo
## de datos abiertos
LOCAL_DATA=True                 # (Usar datos locales o extraerlos directamente de la web del catálogo de datos)
```

#### Despliegue en producción

Una vez se disponga de docker y una base de datos accesible el despliegue del servicio se realiza lanzando la imagen docker.
```
docker run -d -p 8000:8000 --env-file .env totalspizt/data-radar:VERSION

# Nota: 
# En caso de activar LOCAL_DATA para permitir la carga de datos desde los ficheros locales, será necesario mapear
# el volumen /code/data/ a un directorio local en el que se encuentren los datos de los elementos a cargar

docker run -d -p 8000:8000 -v /local/directory/data/:/code/data/ --env-file .env totalspizt/data-radar:VERSION
```
## Entorno de desarrollo

### Prerrequisitos en desarrollo

Con el fin de facilitar las labores de despliegue en el entorno de desarrollo se recomienda la instalación de las
siguientes herramientas:
 
- [Docker](https://www.docker.com/products/docker-desktop)
- [docker-compose](https://docs.docker.com/compose/)
- [make](https://pypi.org/project/make/)

Una vez instalados estos requisitos, no será nisiquiera necesario montar una base de datos MariaDB, ya que la misma
podrá ser levantada utilizando docker.

No obstante, al igual que en el entorno de producción, resulta necesario disponer de un fichero [.env](https://github.com/joseangelmontesmeana/data-radar/blob/master/.example.development.env)
en el que serán definidas las variables de entorno necesarias para el correcto funcionamiento de la aplicación.

###### Ejemplo .env desarrollo
```
# DB: MariaDB
MYSQL_ROOT_PASSWORD=pass_root   # (Password para root en base de datos)
MYSQL_DATABASE=radar_db         # (Nombre de la base de datos)
MYSQL_USER=radar                # (Nombre de usuario en la base de datos)
MYSQL_PASSWORD=radar            # (Password del usuario en base de datos)

## Django DB connection
DB_NAME=radar_db                # (Nombre de la base de datos)
DB_USER=radar                   # (Nombre de usuario en la base de datos)
DB_PASSWORD=radar               # (Password del usuario en base de datos)
DB_HOST=db                      # (Host de la base de datos, si usas compose ha de ser db)
DB_PORT=3306                    # (Puerto de la base de datos, si usas compose ha de ser 3306)

## ETL Setup
## Puedes no proporcionar la variable LOCAL_DATA. En este caso toma valor falso y los datos serán obtenidos del catálogo
## de datos abiertos
LOCAL_DATA=False                # (Usar datos locales o extraerlos directamente de la web del catálogo de datos)

## Django Setup
DEBUG=True                      # (Activar el modo debug en django)
```

#### Despliegue en desarrollo

Una vez cumplidos todos los requisitos, disponemos de dos formas de despliegue, usando make o directamente docker-compose.
###### Usando make
```
# Descargar el repo:
git pull git@github.com:joseangelmontesmeana/data-radar.git 

# Ejecutar:
make up 

# El servicio quedara expuesto en el puerto 8000 de nuestra máquina, y la base de datos en el 3306.

# Para apagar el servicio, basta con ejecutar la siguiente orden:
make clean

# Nota: 
# En caso de activar LOCAL_DATA para permitir la carga de datos desde los ficheros locales,
# asegurarse de disponer de dichos ficheros en el directorio DataRadar/data/ del proyecto.
```

###### Usando docker-compose sin make
```
# Descargar el repo:
git pull git@github.com:joseangelmontesmeana/data-radar.git 

# Ejecutar:
docker-compose up -d --build

# El servicio quedara expuesto en el puerto 8000 de nuestra máquina, y la base de datos en el 3306.

# Para apagar el servicio, basta con ejecutar la siguiente orden:
docker-compose down

# Nota: 
# En caso de activar LOCAL_DATA para permitir la carga de datos desde los ficheros locales,
# asegurarse de disponer de dichos ficheros en el directorio DataRadar/data/ del proyecto.
```

Además de estas funcionalidades, en el [Makefile](https://github.com/joseangelmontesmeana/data-radar/blob/master/Makefile)
se definen algunas otras que pueden resultar interesantes en fase de desarrollo.
