# Create 10 users
User.create(email: 'user1@user.com',
            name: 'Jacek',
            last_name: 'Minaret',
            password: 'qwerty',
            password_confirmation: 'qwerty',
            live_city: 'Poznań',
            interesting_city: 'Poznań',
            confirmed_at: Time.zone.now)
puts User.first.name

User.create(email: 'user2@user.com',
            name: 'Kasia',
            last_name: 'Król',
            password: 'qwerty',
            password_confirmation: 'qwerty',
            live_city: 'Poznań',
            interesting_city: 'Poznań',
            confirmed_at: Time.zone.now)

User.create(email: 'user3@user.com',
            name: 'Piotr',
            last_name: 'Fengshui',
            password: 'qwerty',
            password_confirmation: 'qwerty',
            live_city: 'Kraków',
            interesting_city: 'Kraków',
            confirmed_at: Time.zone.now)
            
User.create(email: 'user4@user.com',
            name: 'Zuzanna',
            last_name: 'Sowińska',
            password: 'qwerty',
            password_confirmation: 'qwerty',
            live_city: 'Kraków',
            interesting_city: 'Kraków',
            confirmed_at: Time.zone.now)
            
User.create(email: 'user5@user.com',
            name: 'Robert',
            last_name: 'Kowalski',
            password: 'qwerty',
            password_confirmation: 'qwerty',
            live_city: 'Warszawa',
            interesting_city: 'Warszawa',
            confirmed_at: Time.zone.now)
            
User.create(email: 'user6@user.com',
            name: 'Łukasz',
            last_name: 'Oliwa',
            password: 'qwerty',
            password_confirmation: 'qwerty',
            live_city: 'Katowice',
            interesting_city: 'Katowice',
            confirmed_at: Time.zone.now)
            
User.create(email: 'user7@user.com',
            name: 'Darek',
            last_name: 'Marczak',
            password: 'qwerty',
            password_confirmation: 'qwerty',
            live_city: 'Poznań',
            interesting_city: 'Poznań',
            confirmed_at: Time.zone.now)

User.create(email: 'user8@user.com',
            name: "Lidia",
            last_name: "Winiary",
            password: 'qwerty',
            password_confirmation: 'qwerty',
            live_city: 'Warszawa',
            interesting_city: 'Warszawa',
            confirmed_at: Time.zone.now)
            
User.create(email: 'user9@user.com',
            name: "Patryk",
            last_name: "Sandbag",
            password: 'qwerty',
            password_confirmation: 'qwerty',
            live_city: 'Katowice',
            interesting_city: 'Katowice',
            confirmed_at: Time.zone.now)
            
User.create(email: 'user10@user.com',
            name: "Bartosz",
            last_name: "Skowronek",
            password: 'qwerty',
            password_confirmation: 'qwerty',
            live_city: 'Poznań',
            interesting_city: 'Poznań',
            confirmed_at: Time.zone.now)

# Kasia and Jacek are cooks
Cook.create(work_city: 'Poznań',
            speciality: 'kuchnia polska',
            user_id: 2)

Cook.create(work_city: 'Kraków',
            speciality: 'kuchnia studencka',
            user_id: 1)

Cook.create(work_city: 'Poznań',
            speciality: 'kuchnia polska',
            user_id: 7)

puts Cook.last.speciality

# Jacek creates a organization
Organization.create(name: "Akademik Góral",
                    city: 'Poznań',
                    description: 'Zjedz pysznie, tanio i zdrowo prosto od studentów!',
                    private_type: true)

Administration.create(user_id: 1, organization_id: 1)


# Kasia creates a organization
Organization.create(name: "Zupki by Kasia",
                    city: 'Poznań',
                    description: 'Najlepsze z najlepszych! Na bazie zupek Knorr.',
                    private_type: true)

Administration.create(user_id: 2, organization_id: 2)

# Piotr creates a organization
Organization.create(name: "BlaBlaZur",
                    city: 'Kraków',
                    description: 'Żurek jak u mamy!',
                    private_type: true)

Administration.create(user_id: 3, organization_id: 3)

puts Organization.last.name

# Kasia is cooking in her organization and in other organization
# Piotr is cooking only in his organization
CooksOrganization.create(cook_id: 1, organization_id: 1)
CooksOrganization.create(cook_id: 1, organization_id: 2)
CooksOrganization.create(cook_id: 2, organization_id: 3)

# Kasia creates a new dish
Dish.create(name: 'Rosołek babci Kazi w pięciu smakach',
            description: 'Zajebiste, polecam 10/10',
            type_of_kitchen: 'kuchnia polska',
            cook_id: 1)

Dish.create(name: 'Rosołek z internetu',
            description: 'Bardzo fajna zupka',
            type_of_kitchen: 'kuchnia polska',
            cook_id: 1)

# Piotr creates a new dish
Dish.create(name: 'Żurek',
            description: 'Najlepszy żurek w Poznaniu',
            type_of_kitchen: 'kuchnia polska',
            cook_id: 2)

puts Dish.last.name

# Kasia creates a new proposal in her organization
Proposal.create(price: 0.00,
                quantity: 2,
                expiration_date: "Mon, 01 Mar 2018 18:00:00 +0100",
                dish_id: 1,
                organization_id: 2,
                cook_id: 1)

# Kasia creates a new proposal in other organization
Proposal.create(price: 2.00,
                quantity: 3,
                expiration_date: "Mon, 02 Mar 2018 21:00:00 +0100",
                dish_id: 2,
                organization_id: 1,
                cook_id: 1)

# Piotr creates a new proposal in his organization
Proposal.create(price: 4.00,
                quantity: 10,
                expiration_date: "Mon, 03 Mar 2018 15:00:00 +0100",
                dish_id: 3,
                organization_id: 3,
                cook_id: 2)

# Jacek follows all organizations
3.times do |n|
  Relationship.create(user_id: 1, organization_id: n+1)
end

# Kasia follows Piotr's organization
Relationship.create(user_id: 2, organization_id: 3)

# Create some ingredients
Ingredient.create(name: 'Marchewka', kind: 0)

Ingredient.create(name: 'Kostka rosołowa', kind: 1)

DishesIngredient.create(dish_id: 1, ingredient_id: 1)

# Create custom orders
CustomOrder.create(quantity: 1,
                   receive_date: Time.zone.now,
                   user_id: 1,
                   proposal_id: 1)

CustomOrder.create(quantity: 2,
                   receive_date: Time.zone.now,
                   user_id: 1,
                   proposal_id: 2)


CustomOrder.create(quantity: 2,
                   receive_date: Time.zone.now,
                   user_id: 1,
                   proposal_id: 3)


puts CustomOrder.last.quantity