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
name = "Tecnológico de Monterrey Campus Monterrey"
city = "Monterrey"
Institution.create(name: name, city: city)

# Professor
department = "Ingeniería y Ciencias"
Professor.create(department: department)

# Admin
Administrator.create()

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
