
# L'ESSENCE - Gestión de perfumes

## Evidencia SENA
GA7-220501096-AA2-EV02: Módulos de software codificados y probados.

## Descripción
Aplicación web desarrollada en Java para gestionar el inventario de perfumes de L'ESSENCE.

## Tecnologías utilizadas
- Java JDK 27
- Apache Maven 3.9.16
- Apache Tomcat 11
- Java Servlets
- JSP
- HTML y CSS
- MySQL
- JDBC

## Funcionalidades
- Visualización del formulario de registro.
- Registro de perfumes mediante el método POST.
- Consulta del inventario mediante el método GET.
- Visualización de los perfumes mediante JSP.
- Conexión con MySQL mediante JDBC.

## Base de datos
Base de datos: lessence_java

Tabla: perfumes

Campos utilizados: id, nombre, marca, categoria, precio y stock.

## Requisitos
- Java JDK 17 o superior.
- Apache Maven.
- Apache Tomcat 11.
- MySQL Server.

## Compilación
Ejecutar en la terminal:

mvn clean package

El archivo WAR se genera en la carpeta target.

## Ejecución
Desplegar lessence-web-servlets.war en la carpeta webapps de Tomcat e iniciar el servidor.

La aplicación estará disponible en:

http://localhost:8080/lessence-web-servlets/index.html

## Repositorio GitHub
https://github.com/LindaJulieth13/lessence-web-servlets

## Autor
Linda Julieth Vergara Arias
