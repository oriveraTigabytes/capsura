# Capsura repo

capsura es un set de script para el despliegue de aplicaciones en google cloud platform

# Como usar

## GAE

Aplica para los scripts que se encuentra en la ruta /scripts/gce

Orden de ejecución:

```bash
sh createVM.sh
```

Este script crea una maquina en gcp cargando en ella el startup script del archivo startupscript.sh

Luego de la creación de la máquina proceder a ejecutar el script para la creación de la regla del firewall para permitir acceder a la aplicación mediante http

```bash
sh firewallRules.sh
```

## App Engine

Estos scripts permiten subir una aplicación nodejs a app engine

Orden de ejecución para standard y flexible:

```bash
sh deploy.sh
```

## GKE

Orden de ejecución:

Primero procederemos a subir una imagen de la aplicación en nodejs a Container Registry

```bash
sh docker.sh
```

Creamos el cluster:

```bash
sh docker.sh
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

## Jenkins

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