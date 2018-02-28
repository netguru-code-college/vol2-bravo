# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create(email: 'test@test.com',
            password: 'qwerty',
            password_confirmation: 'qwerty',
            live_city: 'Poznań',
            interesting_city: 'Poznań',
            confirmed_at: Time.zone.now)

4.times do |n|
  User.create(email: "user-#{n}@bezinfo.com",
              password: 'qwerty',
              password_confirmation: 'qwerty',
              live_city: 'Poznań',
              interesting_city: 'Poznań',
              confirmed_at: Time.zone.now)
end

speciality = ['polska', 'włoska', 'chińska', 'meksykańska']

users_who_want_to_be_masterchef = User.take(3)

users_who_want_to_be_masterchef.each do |user|
  Cook.create(work_city: 'Poznań',
              speciality: speciality.sample,
              user_id: user.id)
end

organizations = ["UAM Poznań", "Put Poznań"]

Organization.create(name: "UAM Poznań",
                    city: 'Poznań',
                    description: 'Bardzo fajne jedzonko!',
                    private_type: true)

Organization.create(name: "Politechnika Poznańska",
                    city: 'Poznań',
                    description: 'Najlepsze z najlepszcych!',
                    private_type: true)

Dish.create(name: 'Rosołek babci Kazi w pięciu smakach',
            description: 'Zajebiste, polecam 10/10',
            type_of_kitchen: 'Chińska',
            spicyness: 1,
            cook_id: Cook.first.id)

Proposal.create(price: 12.04,
                expiration_date: "Mon, 28 Feb 2018 12:42:53 +0100",
                dish_id: Dish.first.id,
                organization_id: Organization.first.id)

Proposal.create(price: 20,
                expiration_date: "Mon, 28 Feb 2018 12:42:53 +0100",
                dish_id: Dish.first.id,
                organization_id: Organization.second.id)


users_who_want_to_create_organization = User.last(2)

Administration.create(user_id: users_who_want_to_create_organization[0].id,
                      organization_id: Organization.first.id)

Administration.create(user_id: users_who_want_to_create_organization[1].id,
                      organization_id: Organization.second.id)

Organization.all.each do |organization|
  Relationship.create(user_id: User.first.id, organization_id: organization.id)
end

Ingredient.create(
            name: 'Marchewka',
            kind: 0)

Ingredient.create(
            name: 'Kostka rosołowa',
            kind: 1)

Ingredient.all.each do |ingredient|
  DishesIngredient.create(dish_id: Dish.first.id, ingredient_id: ingredient.id)
end
