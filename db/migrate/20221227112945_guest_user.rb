class GuestUser < ActiveRecord::Migration[6.1]
  LANGUAGES = %w[Java Ruby Go PHP TypeScript Perl Rust Kotlin Flutter Swift JavaScript Python]
  ACITIVE_AMOUNTS = [15, 30, 45, 60, 120,180]

  def up
    guest = User.create!(name: 'ゲストユーザ',
                        email: 'guest@hogehoge.com',
                        password: 'guestpass',
                        password_confirmation: 'guestpass',
                      )
    12.times do |i|
      guest.items.create(name: LANGUAGES[(i)])
    end
    @items = Item.where(user_id: guest.id)
    guest.items.each do |item|
      rand(10..30).times do
        item.logs.create!(amount: ACITIVE_AMOUNTS.sample, created_at:(rand(1..50)).days.ago)
      end
    end
  end

  def down
    guest = User.find_by(email: 'guest@hogehoge.com')
    guest.destroy
  end
end
