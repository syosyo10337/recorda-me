class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, presence: true, length: { maximum: 30 }

  has_many :items, dependent: :destroy
  has_many :logs, through: :items, dependent: :destroy


  def set_twelve_items
    12.times do |i|
      items.create(name: "項目#{i + 1}")
    end
  end
end
