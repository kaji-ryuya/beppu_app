# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

require "csv"

CSV.foreach('db/beppu_onsen_list3.csv', headers: true) do |info|
  Spa.create(
    name: info[1],
    spring_quality: info[2].to_i,
    place: info[3].to_i,
    location: info[4].to_i,
    charactor: info[5].to_i,
    have_family_bath: info[6],
    address: info[7],
    telephone_number: info[8],
    price: info[9],
    holiday: info[10],
    business_time: info[11],
    is_child_bathing: info[12],
    parking: info[13],
    spa_url: info[15],
    message: info[16],
    family_bath_info: info[17],
    lat: info[18].to_f,
    lng: info[19].to_f,
    place_id: info[20],
    photo_no: info[21].to_i
  )
end