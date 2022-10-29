# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#

# サンプルユーザを作成
User.create!(name: "正尚",
            email: "masanao@example.com",
            password: "masanao16",
            password_confirmation: "masanao16",
)

4.times do |i|
  User.create(name: "サンプルユーザ#{i + 1}",
              email: "sample#{i + 1}@example.com",
              password: "password",
              password_confirmation: "password",
  )
end

# ユーザのアイテムを作成
masa = User.first
other_users = User.where(id: 2..5)
languages = [ "Python", "Java", "Ruby", "Go", "PHP", "TypeScript", "Perl", "Rust", "Kotlin", "Flutter", "Swift", "JavaScript"]

12.times do |i|
  masa.items.create(name: languages[(i)])
end

other_users.each do |user|
  12.times do |i|
    user.items.create(name: "項目#{i + 1}")
  end
end

# ユーザのログを作成
amounts = [15, 30, 60, 120, 180, 45]

masa.items.each do |item|
  10.times do
    item.logs.create!(amount: amounts.sample)
  end
end

other_users.each do |user|
  12.times do |i|
    rand(1..3).times do
      user.items[(i)].logs.create(amount: amounts.sample)
    end
  end
end