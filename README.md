# Conexión Tec
Página web para administrar el registro y evento de Conexión Tec.

### ¿Qué es Conexión Tec?
[Conexión Tec](https://conexiontec.mty.itesm.mx/) es un evento que se realiza al final de cada semestre académico donde se exponen proyectos estudiantiles que atienden problemas de ingeniería relevantes de la industria y de la sociedad.

### Información del cliente
| Nombre                    | Correo electrónico| Rol                |
| ------------------------- | ----------------- | ------------------ |
| Juan M. Hinojosa Olivares | juhinojo@itesm.mx | Profesor de planta |

### Equipo de desarrollo
| Nombre                         | Correo electrónico          | Rol         |
| ------------------------------ | --------------------------- | ----------- |
| Carlos Fernando Garza Martínez | carlosfgarza@gmail.com      | Development |
| Ana Jimena Lomelí Cantú        | jimena.lomeli1@gmail.com    | Development |
| Renata Saldívar González       | renata.saldivar97@gmail.com | Development |

### Setup
Instala las siguientes herramientas de desarrollo:
- [Node](https://nodejs.org/es/download/)
- [Npm](https://www.npmjs.com/get-npm)
- [Yarn](https://classic.yarnpkg.com/en/docs/install/#mac-stable)
- [Git](https://git-scm.com/downloads)
- [Ruby on Rails](https://guides.rubyonrails.org/v6.0/getting_started.html)

### Corre la aplicación en Ruby on Rails
1. Abre tu terminal
2. Clona el proyecto utilizando cualquiera de los siguientes comandos:

SSH:
```bash
$ git clone git@github.com:carliousgarza/ConexionTec.git
```
  
o HTTPS:
```bash
$ git clone https://github.com/carliousgarza/ConexionTec.git
```
3. Entra al directorio de la aplicación:
```bash
$ cd ConexionTec
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
