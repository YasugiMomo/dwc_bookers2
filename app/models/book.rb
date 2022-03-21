class Book < ApplicationRecord
  belongs_to :user

  validates :title, presence: true
  # 空でないかつ最大200文字
  validates :body, presence: true, length: { maximum: 200 }

end
