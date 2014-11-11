# Odoo Dockerfile

## Utilización

Para utilizarlo primero podemos hacer un __docker build__

`` bash
docker build -t="$USER/odoo" .
``

Por ejemplo, nosotros utilizamos como tagname *skennedy/odoo*.

Luego podemos lanzarlo de la siguiente manera:

`` bash
docker run -ti -rm -v $PWD/build:/opt/buildout -v /opt/odoo/odoo8:/opt/buildout/parts/odoo --name odootest8 skennedy/odoo
``

# PostgreSQL

## Datastore en otro container

Se utiliza el link con otro _container_. Hay varias _imagenes_ de *PostgreSQL* en _Docker Hub_. Nosotros elegimos utilizar [sameersbn/postgresql:9.1-1](https://github.com/sameersbn/docker-postgresql). Allí podemos ver las instrucciones correspondientes. Los pasos que nosotros utilizamos fueron los siguientes:

`` bash
    docker pull sameersbn/postgres:9.1-1
    sudo mkdir -p /opt/postgresql_docker/data
    sudo chown -R skennedy:users /opt/postgresql_docker/
    docker run -d --name postgresql -e 'DB_USER=odoo' -e 'DB_PASS=pass' -v /opt/postgresql_docker/data/:/var/lib/postgresql sameersbn/postgresql:9.1-1
``

De esta manera, el datastore nos queda en el Host y no se reinicializa cada vez que restarteamos el container.
Las variables de entorno que definimos al lanzarlo se utilizan luego en el _buildout.cfg_ y ya configura correctamente el archivo openerp.cfg con esos datos.

Si quisieramos acceder al *postgreSQL*:

`` bash
psql -U postgres -h $(docker inspect --format {{.NetworkSettings.IPAddress}} postgresql)
``

## Link con el container de PostgreSQL

Es importante que el link se haga con el nombre *db* ya que esto está configurado luego en el _buildout.cfg_.

Para lanzar el container realizando el link con el _postgreSQL_ con los *volumes* y el puerto expuesto:

`` bash
docker run -ti -rm -p 8099:8069 -v $PWD/build:/opt/buildout -v /home/usuario/.buildout/odoo7:/opt/buildout/parts/odoo --link postgresql:db --name odoopycon skennedy/odoo
``

### Notas

El _password_ de odoodev es password
Igualmente, pertenece al group sudo y no necesita password para sudo.

### TODO:
Explicar por qué los volúmenes que montamos.
