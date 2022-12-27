class UpLogs < ActiveRecord::Migration[6.1]
  LANGUAGES = %w[Java Ruby Go PHP TypeScript Perl Rust Kotlin Flutter Swift JavaScript Python]
  ACITIVE_AMOUNTS = [15, 30, 45, 60, 120,180]

  def up
    user = User.find(2)
    @items = Item.where(user_id: user.id)
    12.times do |i|
      @items[i].update(name: LANGUAGES[i])
    end
    @items.each do |item|
      rand(10..30).times do
        item.logs.create!(amount: ACITIVE_AMOUNTS.sample, created_at:(rand(1..50)).days.ago)
      end
    end
  end

  def down
    user = User.find(2)
    @items = Item.where(user_id: user.id)
    @items.each do |item|
      item.logs.delete_all
    end
  end
end
