# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#

# サンプルユーザを作成
User.create!(name: 'ゲストユーザ',
            email: 'guest@example.com',
            password: 'guestpass',
            password_confirmation: 'guestpass',
          )

4.times do |i|
  User.create(name: "サンプルユーザ#{i + 1}",
              email: "sample#{i + 1}@example.com",
              password: 'password',
              password_confirmation: 'password',
            )
end

# ユーザのアイテムを作成
guest = User.first
other_users = User.where(id: 2..5)
LANGUAGES = %w[Python Java Ruby Go PHP TypeScript Perl Rust Kotlin Flutter Swift JavaScript]

12.times do |i|
  guest.items.create(name: LANGUAGES[(i)])
end

other_users.each do |user|
  12.times do |i|
    user.items.create(name: "項目#{i + 1}")
  end
end

# ユーザのログを作成
AMOUNTS = [15, 30, 60, 120, 45]

guest.items.each do |item|
  40.times do |i|
    item.logs.create!(amount: AMOUNTS.sample, created_at: (i + 1).days.ago)
  end
end

other_users.each do |user|
  12.times do |i|
    rand(1..3).times do
      user.items[(i)].logs.create(amount: AMOUNTS.sample)
    end
  end
end

#自身のデータを残していきます。
masa = User.create!(
  name: '正尚',
  email: 'masanao@example.com',
  password: 'masanao16',
  password_confirmation: 'masanao16',
)

MYITEMS = %w[FE/CS HTML/CSS Linux Ruby JavaScript SQL/DB Rails Git/Github AWS/Docker Network PortFolio 項目12]
12.times do |i|
  masa.items.create!(name: MYITEMS[(i)])
end
