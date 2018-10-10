# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'
  
children = Child.create([{
        first_name: "Maria",
        last_name: "Smith",
        date_of_birth: Date.new(2017, 02, 28)
}, 
    {
        first_name: "Johnny",
        last_name: "Smith",
        date_of_birth: Date.new(2015, 10, 03)
}, {
        first_name: "Lilly",
        last_name: "Johnson",
        date_of_birth: Date.new(2014, 01, 21)
}])
  
fatima = User.create(
        childminder: true, 
        name: "Fatima",
        email: "fatima@email.com",
        password_digest: "fatima",
        phone_number: "07482610800",
        address: Faker::Address.full_address
)   

parents = User.create([{childminder: false, 
name: "Angela Smith",
email: "angelasmith@email.com",
password_digest: "password",
phone_number: "0748261080",
address: Faker::Address.full_address}, 
{
    childminder: false, 
name: "Laura Johnson",
email: "laurajohnson@email.com",
password_digest: "password",
phone_number: "0748261080",
address: Faker::Address.full_address
}, 
{
    childminder: false, 
name: "John Smith",
email: "johnsmith@email.com",
password_digest: "password",
phone_number: "0748261080",
address: Faker::Address.full_address
}])

fatimas_children = UserChild.create([{user_id: fatima.id, child_id: children.first.id},
{user_id: fatima.id, child_id: children.second.id},
{user_id: fatima.id, child_id: children.last.id} ])

children_parents = UserChild.create([{user_id: parents.first.id, child_id:children.first.id}, 
{user_id: parents.first.id, child_id:children.second.id},
{user_id: parents.last.id, child_id:children.first.id},
{user_id: parents.last.id, child_id:children.second.id}, 
{user_id: parents.second.id, child_id:children.last.id}])

day = Day.create(
      date: "2018-09-12",
      start_time: "08:00",
      end_time: "18:00",
      child_id: children.first.id
)

Food.create(  
       breakfast_items: "toast, butter",
       breakfast_had: "all",
       am_snack_items: "fruit",
       am_snack_had: "some",
       lunch_items: "chicken pasta",
       lunch_had: "none",
       pm_snack_items: "yogurt",
       pm_snack_had: "extra",
       dinner_tea_items: "fish and chips",
       dinner_tea_had: "all",
       day_id: day.id
)

NappyPotty.create(
    wet: 4,
    bm_normal: 0,
    bm_runny: 2,
    bm_hard: 0,
    day_id: day.id
)

Nap.create([
    {start: "11:00", end: "12:25",day_id: day.id},
    {start: "15:10", end: "16:05",day_id: day.id}       
])

Note.create(
    daily_note: "Had a good day overall, learned to play with paint",
    day_id: day.id
)