categories = %w(entree desert apettizer snack)

50.times do
  Recipe.create({
      title: Faker::Food.dish,
      category: categories[rand(3)],
      preparation_time: Faker::Number.decimal,
      oven_time: Faker::Number.decimal,
      ingredients: Faker::Lorem.sentence,
      steps: Faker::Lorem.sentence,
      image: ""
  })
end
