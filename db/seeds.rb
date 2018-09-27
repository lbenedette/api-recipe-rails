categories = %w(entree desert apettizer snack)

User.create({
    name: "Leonardo Lopes",
    email: "test@test.com",
    password: "password",
    password_confirmation: "password",
})

10.times do
  Recipe.create({
      title: Faker::Food.dish,
      category: categories[rand(3)],
      preparation_time: Faker::Number.decimal,
      oven_time: Faker::Number.decimal,
      ingredients: Faker::Lorem.sentence,
      steps: Faker::Lorem.sentence,
      image: "",
      user_id: 1
  })
end
