## BEST SELLERS

Best Sellers es una applicación web que provee diariamente uno de los cuatro artículos más vendidos en Falabella de forma aleatoria.


### Requerimientos Generales

* Ruby 2.2.0
* Rails 4.2.0
* Postgres 9.3.5.2
* RVM 1.26.7


### Instalación Local

Primero clona el repositorio en tu carpeta de aplicaciones:

```
git clone https://github.com/MarioRamirez/bestsellers-acidlabs.git bestsellers-acidlabs
```

En segundo lugar, ingresa a la carpeta `bestsellers-acidlabs`:

```zsh
cd bestsellers-acidlabs
```

Luego, crea el `gemset` para la aplicación:

```
rvm use ruby-2.2.0@bestsellers-acidlabs --ruby-version --create
```

Después, instala las gemas para el entorno de desarrollo:

```
bundle install --without production
```

Por último, crea la base de datos de la aplicación:

```rake
rake db:setup
```

### Comenzando

Puedes partir obteniendo los primeros productos de forma manual ejecutando:

```rake
rake bestsellers
```

O bien, establecer un periodo menor de recopilación automática en el archivo `/config/schedule.rb`, por ejemplo:

```ruby
every 1.minute do
  rake "bestsellers"
end
```

Y luego programa la tarea con el nuevo periodo ejecutando el comando:

```
whenever --update-crontab fetchBestSellers --set environment=development
```

Listo, ahora sólo debes levantar el servidor con `rails s` e ingresar por medio de tu navegador a `http://localhost:3000/`.

IMPORTANTE: si en tu terminal aparece el mensaje `You have new mail` ejecuta `crontab -e` y añade la línea `MAILTO=""` en la parte superior del documento, no olvides guardar el archivo al salir.


### Instalación en Producción

Para levantar esta aplicación a producción, primero necesitas una cuenta en `Heroku` e instalar `Heroku Toolbelt`, programa que puedes descargar desde `https://toolbelt.heroku.com/`.

Una vez hecho lo anterior, ejecuta el siguiente comando y escribe los datos que se solicitan:

```
heroku login
```

Cuando hayas ingresado asegurate de estar situado en la directorio de la aplicación, y posteriormente, ejecuta estos comandos de modo secuencial:

```
heroku create
```

```
git push heroku master
```

```
heroku run rake db:migrate
```

```
heroku run rake bestsellers
```

```
heroku open
```

Listo, ya tienes la aplicación funcionando a través de internet. Ahora sólo falta configurar `Heroku Scheduler` para recopilar la información diariamente, este addon es gratuito, sin embargo, debes tener una tarjeta de crédito asociada a tu cuenta.

Para instalar el addon `Heroku Scheduler` debes ejecutar lo siguiente:

```
heroku addons:add scheduler:standard
```

Después ejecuta este comando para abrir el panel donde se programan las tareas:

```
heroku addons:open scheduler
```

Finalmente haz clic sobre el botón `Add Job...`, escribe `rake bestsellers` al comienzo y luego selecciona `1X`, `Daily` y la `hora del día` respectivamente. Haz clic en `Save` para terminar.


### Versión de Demostración

Puedes ver la aplicación funcionando en `https://bestsellers-acidlabs.herokuapp.com/`