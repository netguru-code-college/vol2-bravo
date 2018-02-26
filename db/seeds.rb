# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create(email: 'example@example.com',
            password: 'qwerty',
            password_confirmation: 'qwerty',
            live_city: 'Poznań',
            interesting_city: 'Szczecin')

Cook.create(work_city: 'Poznań',
            user_id: User.all.first.id)

Organization.create(name: 'UAM Poznań',
                    city: 'Poznań',
                    description: 'Bardzo fajne jedzonko!',
                    private_type: true)

Dish.create(name: 'Rosołek babci Kazi w pięciu smakach',
            description: 'Zajebiste, polecam 10/10',
            type_of_kitchen: 'Chińska',
            spicyness: 1,
            cook_id: Cook.all.first.id)

Proposal.create(price: 12.04,
                expiration_date: "Mon, 28 Feb 2018 12:42:53 +0100",
                dish_id: Dish.all.first.id)

Administration.create(
                user_id: User.all.first.id,
                organization_id: Organization.all.first.id)

Ingredient.create(
            name: 'Marchewka',
            kind: 'Warzywo')

DishesIngredient.create(
            dish_id: Dish.all.first.id,
            ingredient_id: Ingredient.all.first.id)
