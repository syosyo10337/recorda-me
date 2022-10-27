class Item < ApplicationRecord
  belongs_to :user
  has_many :logs, dependent: :destroy

  validates :user, presence: true
  validates :name, length: { in: 0..15 } 
  #(後で)アイテムの個数を制限したい。
  # validate :limit_items_count_per_user
  
  #Example:
  # def limit_items_count_per_user
  #   if Item.group(self.id).count > 12
  #     errors.add(:item, "12まで")
  #   end
  # end
end
