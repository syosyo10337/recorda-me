class Log < ApplicationRecord
  belongs_to :item
  has_one :user, through: :item
  scope :order_desc, -> { order(created_at: :desc) }

  validates :item_id, presence: true
  validates :amount, numericality: { less_than_or_equal_to: 180, greater_than: 0 }
end
