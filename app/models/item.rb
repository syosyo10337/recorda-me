class Item < ApplicationRecord
  belongs_to :user
  has_many :logs, dependent: :destroy

  validates :user_id, presence: true
  validates :name, length: { in: 0..15 } 


  # validates :maximum_twelve_per_user
  #後で！
  #ユーザが持てる項目数を制限したい。
  #そもそもcreateがないならOK?






end
