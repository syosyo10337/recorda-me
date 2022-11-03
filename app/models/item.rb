class Item < ApplicationRecord
  belongs_to :user
  has_many :logs, dependent: :destroy

  validates :user, presence: true
  validates :name, length: { in: 0..15 }
  # groupdate gemによるグルーピングで干渉を避けつつ、取得する順番を固定する。
  # _log_formと、items#index主に使う。
  scope :get_fixed_order, -> { order(:id) }
end
