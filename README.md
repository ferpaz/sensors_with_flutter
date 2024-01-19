# miscelaneos

Una aplicación que permite gestionar permisos a recursos nativos del dispositivo.

Para mantener los Code Generators de Riverpod utilizar:

> dart run build_runner watch

----------------------------------
Configurando WebApp para Deep Link
----------------------------------

INSTALANDO paquete:
  change_app_package_name

Renonbrando la App

    > flutter pub run change_app_package_name:main com.new.package.name

GENERANDO sha-256
    > cd android
    > ./gradlew signingReport

    Si da error que no esta bien el JAVA_HOME se puede ejecutar esto

         Set-Item Env:JAVA_HOME "C:\Program Files\Java\jdk-11"

PUBLICAR EL WEBSITE  (deep-link-web)

    Crear un sitio (con una URL por cada Pokemon)
    Se hizo un sitio estático solo con HTML

    Se creo un folder ./well-known y se creo dentro el archivo assetlinks.json

    Una vez publicado este sitio, se puede probar con este link de Google

        https://developers.google.com/digital-asset-links/tools/generator

    Se debe llenar los datos con el dominio del sitio publicado (solo dominio), nombre del paquete de la App y el fingerprint sha256 generado

    El archivo con la metadata debe ser accesible en esta direccion:

        https://victorious-desert-01b286e0f.4.azurestaticapps.net/.well-known/assetlinks.json

