# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Doctor.create!(
[
{ name: "Dr. Georger", doctor_type: "Allopathic", specialization: "Surgery",
  qualification: "M.D. Surgery", years_of_exp: 10, rating: 4, total_ratings: 100
},
{
name: "Dr. Alpha", doctor_type: "Ayurvedic", specialization: "Cardiology",
  qualification: "M.D. Cardiology", years_of_exp: 7, rating: 3, total_ratings: 150
},
{
name: "Dr. Beta", doctor_type: "Homopathy", specialization: "Public Heath",
  qualification: "M.D. Public Health", years_of_exp: 5, rating: 4, total_ratings: 200
}
]
)

p "Created #{Doctor.count} doctors"

Patient.create!(
[
{
name: "Rama", birth_date: Date.parse('2001-02-03'), image_loc: "/usr/tmp/image1. jpg", medical_report_loc: "/usr/tmp/image2.jpg", age: 18, gender: "female"
},
{
name: "Shyama", birth_date: Date.parse('2003-02-03'), image_loc: "/usr/tmp/image3.jpg", medical_report_loc: "/usr/tmp/image4.jpg", age: 16, gender: "male"
},
{
name: "Som", birth_date: Date.parse('2001-08-12'), image_loc: "/usr/tmp/image1. jpg", medical_report_loc: "/usr/tmp/image2.jpg", age: 18, gender: "female"
}
]
)

p "Created #{Patient.count} patients"
