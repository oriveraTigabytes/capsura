# Capsura repo

Capsura es un set de scripts para el despliegue de aplicaciones en google cloud platform. Todos lo que necesitas en correr los scrips en la ruta /scripts/ y luego ingresando a la carpeta correspondiente a google compute engine (gce), appengine, google kubernetes engine (gke) y jenkins.-

# Como usar

## Google Compute Engine (/scripts/gce/)

Estos scripts permiten crear una maquina en gce y correr una aplicación en nodejs.

Orden de ejecución:

```bash
sh createVM.sh
```
Si es la primera vez que vas a crear una VM pedirá que actives la api de compute. Ingres [y] y continuar.

Este script crea una máquina en gcp cargando en ella el startup script del archivo startupscript.sh

Luego de la creación de la máquina proceder a ejecutar el script para la creación de la regla del firewall para permitir acceder a la aplicación mediante http

```bash
sh firewallRules.sh
```

## App Engine (/scripts/appengine/standard | /scripts/appengine/flexible)

Estos scripts permiten subir una aplicación nodejs a app engine.

Orden de ejecución para standard y flexible:

```bash
sh deploy.sh
```

## GKE (/scripts/gke/)

Orden de ejecución:

Primero procederemos a subir una imagen de la aplicación en nodejs a Container Registry.

nota: Puede que al momento de intentar subir la imagen a container registry de error debido a que no esta habilitada la la api. Puedes esperar a que aparezca el mensaje y luego copiar el link que ahí te indica o hacerlo con el siguiente link cambiando el proyecto:

https://console.cloud.google.com/apis/api/containerregistry.googleapis.com/overview?project=[YOUR-PROJECT]

```bash
sh docker.sh
```

Creamos el cluster:

nota: al igual que el paso anterior si la api no está habilitada dará error por lo que la habilitamos con el siguiente link:

https://console.cloud.google.com/apis/api/container.googleapis.com/overview?project=[YOUR-PROJECT]

```bash
sh createCluster.sh
```

Creamos el deployment con un pod:

```bash
sh createPod.sh
```

Creamos el servicio asociado al deployment y lo exponemos:

```bash
sh createService.sh
```

Para escalar a mas replicas ejecutar:

```bash
sh scale.sh
```

Para modificar una imagen, primero modificar la aplicación y subir la nueva imagen:

```bash
sh docker2.sh
```

Despues de modificar la imagen editamos el deployment. Agregamos la imagen versión y guardarmos:

```bash
sh editDeployment.sh
```

## Jenkins (/scripts/jenkins/)

Instalamos Jenkins en Kubernetes:

```bash
sh jenkins.sh
```

Para crear un pipeline y hacer que jenkins funcione con cloud repository ejecutamos:

```bash
sh repo.sh
```

La aplicación ya tiene un archivo Jenkinsfile para que pueda ser usado en jenkins. Faltaría agregarlo como tarea y crear una clave para que jenkins pueda acceder al repositorio y a app engine.

nota: no olvidar habilitar la appengine admin api en el proyecto.


## Cloud Function (/scripts/gcf/)

Crea una función en gcp en nodejs10

```bash
sh createFunction.sh
```

