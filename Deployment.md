# Conexión Tec Deployment

### Setup
Instala las siguientes herramientas de desarrollo:
- [Heroku CLI](https://devcenter.heroku.com/articles/heroku-cli#download-and-install)
- [Git](https://git-scm.com/downloads)

Asegurate de estar como colaborador en la aplicación de heroku


### Obtén la versión más actualizada del proyecto
1. Abre tu terminal
2. Entra al directorio de la aplicación
```bash
$ cd conexion_tec_2
```
3. Corre el siguiente comando:
```bash
$ git pull origin master
```
4. Corre el siguiente comando:
```bash
$ heroku git:remote -a conextec2021
$ git push heroku master
```
5. Al terminar el deploy se puede accesar la app en el siguiente URL

https://conextec2021.herokuapp.com/
