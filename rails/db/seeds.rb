User.create!({
    name: "Leonardo Lopes",
    email: "test@test.com",
    password: "password",
    password_confirmation: "password"
})

10.times do
  Recipe.create!({
      title: Faker::Food.dish,
      category: rand(3),
      preparation_time: 10.5,
      oven_time: 4.5,
      ingredients: Faker::Lorem.sentence,
      steps: Faker::Lorem.sentence,
      image: "",
      user_id: 1
  })
end
