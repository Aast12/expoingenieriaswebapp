# Conexión Tec
Página web para administrar el registro y evento de Conexión Tec.

### ¿Qué es Conexión Tec?
[Conexión Tec](https://conexiontec.mty.itesm.mx/) es un evento que se realiza al final de cada semestre académico donde se exponen proyectos estudiantiles que atienden problemas de ingeniería relevantes de la industria y de la sociedad.

### Información del cliente
| Nombre                    | Correo electrónico| Rol                |
| ------------------------- | ----------------- | ------------------ |
| Daniel Guajardo Flores | danielgdo@tec.mx | Profesor Investigador |

### Equipos de desarrollo: 
Avocadoware, para Agosto-Diciembre 2020
| Nombre                         | Correo electrónico          | Rol         |
| ------------------------------ | --------------------------- | ----------- |
| Esteban Torres Alarcon         | A01193925@itesm.mx          | Development |
| Santiago Castaño Moreno        | A01193760@itesm.mx          | Development |
| Alejandro Longoria Esparza     | A00817379@itesm.mx          | Development |

Dos punto Seis, para Febrero-Junio 2021
| Nombre                            | Correo electrónico          | Rol                      |
| ----------------------------------| --------------------------- | ------------------------ |
| José Alberto Marcial Sánchez      | A01701803@itesm.mx          | Adm. del Proyecto        |
| Ana Paola Treviño Mánica          | A01176521@itesm.mx          | Product Owner Proxy      |
| Alicia Guadalupe Cisneros Morales | A01281991@itesm.mx          | Adm. de la Configuración |
| Eduardo Aguilar Leal              | A01193626@itesm.mx          | SCRUM Master y Líder     |


### Setup
Instala las siguientes herramientas de desarrollo:
- [Node](https://nodejs.org/es/download/)
- [Npm](https://www.npmjs.com/get-npm)
- [Yarn](https://classic.yarnpkg.com/en/docs/install/#mac-stable)
- [Git](https://git-scm.com/downloads)
- [Ruby on Rails](https://guides.rubyonrails.org/v6.0/getting_started.html)

#### Versionamiento del proyecto
- Ruby 2.6.3; [instalando versiones específicas de Ruby](https://rvm.io/rvm/install)
- Rails 6.0.2
- Sqlite 1.4



### Corre la aplicación en Ruby on Rails
1. Abre tu terminal
2. Clona el proyecto utilizando cualquiera de los siguientes comandos:

SSH:
```bash
$ git clone git@github.com:ProyectoIntegrador2018/conexion_tec_2.git
```
  
o HTTPS:
```bash
$ git clone https://github.com/carliousgarza/ConexionTec.git
```
3. Entra al directorio de la aplicación:
```bash
$ cd conexion_tec_2
```
4. Corre los siguientes comandos:
```bash
$ gem install bundler
$ bundle install
$ yarn install
```
5. Crear y poblar la base de datos:
```bash
$ rails db:create
$ rails db:migrate
$ rails db:seed
```
6. Corre la aplicación de manera local:
```bash
$ rails server
```
