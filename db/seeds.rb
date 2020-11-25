# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Edition
name = "Feb-Dec 2020"
start_date = Date.new(2020, 2, 1)
end_date = Date.new(2020, 12, 31)
Edition.create(name: name, start_date: start_date, end_date: end_date)

# Institution
Institution.create(name: "Tecnológico de Monterrey Campus Monterrey", city: "Monterrey")
Institution.create(name: "Tecnológico de Monterrey Campus Saltillo", city: "Monterrey")
Institution.create(name: "Tecnológico de Monterrey Campus Laguna", city: "Monterrey")
Institution.create(name: "Tecnológico de Monterrey Campus Tampico", city: "Centro-Sur")
Institution.create(name: "Prepa Tec Monterrey", city: "Monterrey")

# Departments
Department.create(name: "Bioingeniería")
Department.create(name: "Ciencias")
Department.create(name: "Computación")
Department.create(name: "Industrial")
Department.create(name: "Mecánica y Materiales Avanzados")
Department.create(name: "Mecatronica y Electrónica")
Department.create(name: "Tecnologías Sostenibles y Civil")
Department.create(name: "Otro")

# Areas
ProjectArea.create(name: "Agriobiotecnología")
ProjectArea.create(name: "Automatización de Proceso")
ProjectArea.create(name: "Bionegocios")
ProjectArea.create(name: "Diseño Industrial")
ProjectArea.create(name: "Electronica-Hardware")
ProjectArea.create(name: "Ingenieria Civil")
ProjectArea.create(name: "Ingenieria de Alimentos")
ProjectArea.create(name: "Ingenieria Industrial")
ProjectArea.create(name: "Ingenieria Mecanica")
ProjectArea.create(name: "Ingenieria Quimica")
ProjectArea.create(name: "Modelo Arquitectonico")
ProjectArea.create(name: "Modelo de Negocio")
ProjectArea.create(name: "Nanotecnología")
ProjectArea.create(name: "Proceso de Producción")
ProjectArea.create(name: "Quimica-Bioquimica")
ProjectArea.create(name: "Sistemas Embebidos")
ProjectArea.create(name: "Software")


# Admin
Administrator.create()

#Base Categories:
ProjectCategory.create(name: "Desarrollo de Prototipo Físico")
ProjectCategory.create(name: "Desarrollo de Prototipo de Software")
ProjectCategory.create(name: "Investigacion y Desarrollo de Propuestas de Mejora")
ProjectCategory.create(name: "Productos o Servicios para Emprendimiento de Base Tecnológica")

# User
email = "luis@tec.mx"
password = "123123"
first_name = "Luis"
last_name = "Gonzalez"
userable_id = 1
userable_type = "Professor"
edition_id = 1
institution_id = 1
User.create(email: email, password: password, first_name: first_name, last_name: last_name, userable_id: userable_id, userable_type: userable_type, edition_id: edition_id, institution_id: institution_id)

email = "juan@tec.mx"
password = "123123"
first_name = "Juan"
last_name = "Hinojosa"
userable_id = 1
userable_type = "Administrator"
edition_id = 1
institution_id = 1
User.create(email: email, password: password, first_name: first_name, last_name: last_name, userable_id: userable_id, userable_type: userable_type, edition_id: edition_id, institution_id: institution_id)
