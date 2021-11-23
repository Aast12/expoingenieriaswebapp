# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Edition
name = "Feb-Dec 2020"
start_date_edition = Date.new(2021, 2, 1)
end_date_edition = Date.new(2021, 12, 31)
Edition.create(name: name, start_date: start_date_edition, end_date: end_date_edition)

# Phase
Phase.create(name:"Registro", start_date: Date.new(2021, 2, 1), end_date: Date.new(2021, 3, 1), edition_id: 1)
Phase.create(name:"Edición de datos / Retroalimentación", start_date: Date.new(2021, 3, 2), end_date: Date.new(2021, 4, 1), edition_id: 1)
Phase.create(name:"Aprobación de proyectos", start_date: Date.new(2021, 4, 2), end_date: Date.new(2021, 5, 1), edition_id: 1)
Phase.create(name:"Evaluación de proyectos", start_date: Date.new(2021, 5, 2), end_date: Date.new(2021, 6, 1), edition_id: 1)
Phase.create(name:"Selección de proyectos", start_date: Date.new(2021, 5, 2), end_date: Date.new(2021, 6, 1), edition_id: 1)
Phase.create(name:"Crear / Editar muestra", start_date: Date.new(2021, 5, 2), end_date: Date.new(2021, 6, 1), edition_id: 1)
Phase.create(name:"Asignación de proyectos a evaluadores", start_date: Date.new(2021, 5, 2), end_date: Date.new(2021, 6, 1), edition_id: 1)
Phase.create(name:"Evaluación  de proyectos", start_date: Date.new(2021, 5, 2), end_date: Date.new(2021, 6, 1), edition_id: 1)
# Timelimit

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

#Base Categories:
ProjectCategory.create(name: "Desarrollo de Prototipo Físico")
ProjectCategory.create(name: "Desarrollo de Prototipo de Software")
ProjectCategory.create(name: "Investigacion y Desarrollo de Propuestas de Mejora")
ProjectCategory.create(name: "Productos o Servicios para Emprendimiento de Base Tecnológica")

# Users
userable = Administrator.create()
User.create(
    email: "juan@tec.mx",
    password: "123123",
    first_name: "Juan",
    last_name: "Hinojosa",
    userable_id: userable.id,
    userable_type: "Administrator",
    edition_id: 1,
    institution_id: 1
)

userable_p = Professor.create()
User.create(
    email: "luis@tec.mx", 
    password: "123123",
    first_name: "Luis",
    last_name: "Gonzalez",
    userable_id: userable_p.id,
    userable_type: "Professor",
    edition_id: 1,
    institution_id: 1,
)



userable = Student.create(
    major: "ITC",
    student_code: "A01234567"
)
User.create(
    email: "pepe@tec.mx", 
    password: "123123",
    first_name: "Pepe",
    last_name: "Garza",
    userable_id: userable.id,
    userable_type: "Student",
    edition_id: 1,
    institution_id: 1,
)


userable = Student.create(
    major: "ITC",
    student_code: "A01234567"
)
User.create(
    email: "paco@tec.mx", 
    password: "123123",
    first_name: "Frnacisco",
    last_name: "Sa",
    userable_id: userable.id,
    userable_type: "Student",
    edition_id: 1,
    institution_id: 1,
)

userable_0 = Student.create(
    major: "ITC",
    student_code: "A03445634"
)
User.create(
    email: "franPaco@tec.mx", 
    password: "123123",
    first_name: "Franco",
    last_name: "Fa",
    userable_id: userable_0.id,
    userable_type: "Student",
    edition_id: 1,
    institution_id: 1,
)
userable_1 = Student.create(
    major: "ITC",
    student_code: "A00823658"
)
User.create(
    email: "paco_gg@tec.mx", 
    password: "123123",
    first_name: "Pepo",
    last_name: "Su",
    userable_id: userable_1.id,
    userable_type: "Student",
    edition_id: 1,
    institution_id: 1,
)
userable_2 = Student.create(
    major: "ITC",
    student_code: "A01232367"
)
User.create(
    email: "alec@tec.mx", 
    password: "123123",
    first_name: "Alex",
    last_name: "Sa",
    userable_id: userable_2.id,
    userable_type: "Student",
    edition_id: 1,
    institution_id: 1,
)