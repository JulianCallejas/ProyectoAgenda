# Testing de la aplicación AgendAPP

Para realizar las pruebas de la aplicación se utilizo la herramienta [Postman](https://www.postman.com/) la cual es una herramienta usada para realizar pruebas a API's principalmente.
En este caso las pruebas se realizaron a los endpoints de la aplicación, los cuales retornan como respuesta una pagina HTML completa.
Las pruebas realizadas a a la aplicación se pueden categorizar como pruebas unitarias y de integración.

# Colección Postman

Las peticiones en postman se puededen agrupar en carpetas y colecciones, para este proyecto se encuentran dentro de una colección llamada **AgendAPP**. Cada petición tiene un url, un body y un test, el cuál es un script de JavaScript. Algunas de las peticiones incluyen un pre-request script para efectos de autenticación o validación de formularios (CSRF-TOKEN).
La colección se puede exportar e importar en formato JSON. La versión más reciente de la misma se encuentra en la carpeta tests del proyecto, con el nombre **AgendAPP.postman_collection.json**
Para agregar más peticiones o editar las existentes, y sus correspondientes test, se puede importar la colección en postman y realizar desde ahí las modificaciones necesarias.

## Generación de Reporte HTML

La carpeta test es un proyecto de Node.JS el cuál tiene un script de javascript para la generación del reporte en HTML. Para generar el reporte se debe instalar las dependencias necesarias, las cuáles ya se encuentran en el archivo **package.json**, esto se hace ingresando a la carpeta test y ejecutando el comando **npm install**.
Una vez instaladas las dependencias necesarias y actualizado la colección json de postman se procede a iniciar la aplicación **AgendApp** y posteriormente se ejecuta desde otra consola consola, dentro de la carpeta test, el comando **node .** 
El archivo html se generara en una carpeta con la fecha y hora en la que se ejecuto el script. Este archivo tendrá como nombre **AgendaAPPTests.html**

## Reporte en linea en Github Pages

El reporte puede visualizarse en la página: [agendapp-tests-report](https://mignarvaez.github.io/agendapp-tests-report/). Está página está asociada al repositorio: https://github.com/mignarvaez/agendapp-tests-report.
Para actualizar el reporte basta con cambiarle el nombre al reporte html generado en el paso anterior por **index.html** y subirlo en el repositorio que aquí se indica.