class Item < ApplicationRecord
  belongs_to :user
  has_many :logs, dependent: :destroy

  validates :user, presence: true
  validates :name, length: { in: 0..15 }
end
