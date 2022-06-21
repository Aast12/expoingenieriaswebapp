# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)



# Edition
name = "Feb-Jun 2022"
start_date_edition = Date.new(2022, 2, 14)
end_date_edition = Date.new(2022, 6, 30)
Edition.create(name: name, start_date: start_date_edition, end_date: end_date_edition)

# Phase
Phase.create(name:"Registro de proyectos", start_date: Date.new(2022, 2, 14), end_date: Date.new(2022, 5, 26), edition_id: 1)
Phase.create(name:"Edición de datos / Retroalimentación", start_date: Date.new(2022, 2, 14), end_date: Date.new(2022, 2, 26), edition_id: 1)
Phase.create(name:"Aprobación de proyectos", start_date: Date.new(2022, 4, 2), end_date: Date.new(2022, 5, 14), edition_id: 1)
Phase.create(name:"Crear/editar muestra", start_date: Date.new(2022, 5, 2), end_date: Date.new(2022, 6, 14), edition_id: 1)
Phase.create(name:"Evaluación  de proyectos en el evento virtual", start_date: Date.new(2022, 5, 2), end_date: Date.new(2022, 6, 14), edition_id: 1)
Phase.create(name:"Evaluación  de proyectos en el evento presencial", start_date: Date.new(2022, 5, 2), end_date: Date.new(2022, 6, 14), edition_id: 1)
Phase.create(name:"Ver proyectos evaluados", start_date: Date.new(2022, 5, 2), end_date: Date.new(2022, 6, 14), edition_id: 1)
Phase.create(name:"Muestra virtual", start_date: Date.new(2022, 5, 2), end_date: Date.new(2022, 6, 14), edition_id: 1)
Phase.create(name:"Ver comentarios dejados en el proyectos", start_date: Date.new(2022, 5, 2), end_date: Date.new(2022, 6, 14), edition_id: 1)
Phase.create(name:"Ver calificación de proyectos evaluados", start_date: Date.new(2022, 5, 2), end_date: Date.new(2022, 6, 14), edition_id: 1)
Phase.create(name:"Obtención de constacias de participación", start_date: Date.new(2022, 5, 2), end_date: Date.new(2022, 6, 14), edition_id: 1)
# Timelimit


# Institution
Institution.create(name: "Monterrey", city: "Monterrey")
Institution.create(name: "Saltillo", city: "Saltillo")
Institution.create(name: "Laguna", city: "Torreón")
Institution.create(name: "Tampico", city: "Tampico")
Institution.create(name: "Cumbres", city: "Monterrey")
Institution.create(name: "Garza Sada", city: "Monterrey")
Institution.create(name: "Santa Catarina", city: "Monterrey")
Institution.create(name: "Garza Lagüera", city: "Monterrey")
Institution.create(name: "Valle Alto", city: "Monterrey")

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
ProjectArea.create(name: "Agrobiotecnología")
ProjectArea.create(name: "Automatización de Proceso")
ProjectArea.create(name: "Bionegocios")
ProjectArea.create(name: "Diseño Industrial")
ProjectArea.create(name: "Electrónica-Hardware")
ProjectArea.create(name: "Ingeniería Civil")
ProjectArea.create(name: "Ingeniería de Alimentos")
ProjectArea.create(name: "Ingeniería Industrial")
ProjectArea.create(name: "Ingeniería Mecánica")
ProjectArea.create(name: "Ingeniería Mecatrónica")
ProjectArea.create(name: "Ingeniería Química")
ProjectArea.create(name: "Modelo Arquitectónico")
ProjectArea.create(name: "Modelo de Negocio")
ProjectArea.create(name: "Nanotecnología")
ProjectArea.create(name: "Proceso de Producción")
ProjectArea.create(name: "Química-Bioquímica")
ProjectArea.create(name: "Sistemas Embebidos")
ProjectArea.create(name: "Software")
ProjectArea.create(name: "Emprendimiento en Base Tecnológica")



#Base Categories:
ProjectCategory.create(name: "Desarrollo de Prototipo Físico")
ProjectCategory.create(name: "Desarrollo de Prototipo de Software")
ProjectCategory.create(name: "Investigación y Desarrollo de Propuestas de Mejora")
ProjectCategory.create(name: "Productos o Servicios para Emprendimiento de Base Tecnológica")








#Users
userProf = User.new(
    email: "juanh@tec.mx", 
    password: "143143", 
    first_name: "Luis", 
    last_name: "Gonzalez", 
    is_professor: 1
)
userProf.skip_confirmation!
userProf.save
prof = Professor.new(
    department: "Ciencias",
    user_id: userProf.id
)
prof.save

userAdmin = User.new(
    email: "admin@tec.com",
    password: "143143",
    first_name: "Juan",
    last_name: "Hinojosa",
    is_admin: 1
)
userAdmin.skip_confirmation!
userAdmin.save
admin = Administrator.new(
    user_id: userAdmin.id
)
admin.save



userStudent = User.new(
    email: "student@tec.com",
    password: "143143",
    institution_id: 1,
    first_name: "Fernanda",
    last_name: "Sánchez",
    is_student: 1
)
userStudent.skip_confirmation!
userStudent.save
student = Student.create(
    user_id: userStudent.id,
    major: "ITC",
    student_code: "A01570306"
)



userStudent2 = User.new(
    email: "student2@tec.com",
    password: "143143",
    institution_id: 1,
    first_name: "Claudia",
    last_name: "Rivera",
    is_student: 1
)
userStudent2.skip_confirmation!
userStudent2.save
student2 = Student.create(
    user_id: userStudent2.id,
    major: "ITC",
    student_code: "A01570307"
)


userStudent3 = User.new(
    email: "student3@tec.com",
    password: "143143",
    institution_id: 1,
    first_name: "Blanca",
    last_name: "Posada",
    is_student: 1
)
userStudent3.skip_confirmation!
userStudent3.save
student3 = Student.create(
    user_id: userStudent3.id,
    major: "ING",
    student_code: "A01570308"
)

userCommitteMember = User.new(
    email: "committe@tec.com",
    password: "123123",
    institution_id: 1,
    first_name: "Mario",
    last_name: "Garza",
    is_committee_member: 1
)
userCommitteMember.skip_confirmation!
userCommitteMember.save
committeMember = CommitteeMember.create(
    user_id: userCommitteMember.id,
)




# Users Previous DB
# userable = Administrator.create()
# User.create(
#     email: "juan@tec.mx",
#     password: "143143",
#     first_name: "Juan",
#     last_name: "Hinojosa",
#     edition_id: 14,
#     institution_id: 14
# )

# userable = Professor.create(
#     department: "ITC"
# )
# User.create(
#     email: "luis@tec.mx", 
#     password: "143143",
#     first_name: "Luis",
#     last_name: "Gonzalez",
#     edition_id: 14,
#     institution_id: 14,
# )

# userable = Student.create(
#     major: "ITC",
#     student_code: "A01434567"
# )
# User.create(
#     email: "pepe@tec.mx", 
#     password: "143143",
#     first_name: "Pepe",
#     last_name: "Garza",
#     userable_id: userable.id,
#     userable_type: "Student",
#     edition_id: 14,
#     institution_id: 14,
# )
