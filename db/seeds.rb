# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


require "csv"

CSV.foreach('db/seeds/workers.csv', headers: true) do |row|
  User.create(
    idnumber: row['idnumber'],
    name: row['name'],
    workplace: row['workplace'],
    email: row['email'],
    password: row['password'],
    admin: row['admin'],
    HR: row['HR'],
    root: row['root'],
    birth: row['birth'],
    join_date: row['join_date'],
    gender: row['gender'],
  )
end
