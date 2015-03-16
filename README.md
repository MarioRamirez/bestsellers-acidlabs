## BEST SELLERS

Best Sellers es una applicación web que provee diariamente uno de los cuatro artículos más vendidos en Falabella de forma aleatoria.


### Requerimientos Generales

* Ruby 2.2.0
* Rails 4.2.0
* Postgres 9.3.5.2
* RVM 1.26.7

### Instalación en Producción

Haz clic en el botón de abajo para configurar automáticamente una versión de demostración de la apliación corriendo en tu cuenta de Heroku. (No olvides ejecutar `heroku run rake db:migrate` una vez la aplicación haya sido desplegada).

[![Deploy](https://www.herokucdn.com/deploy/button.svg)](https://heroku.com/deploy)

De forma alternativa, puedes crear manualmente una aplicación en Heroku y luego utilizar Git para subir y desplegar Best Sellers.


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