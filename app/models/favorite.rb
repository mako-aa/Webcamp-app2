class Favorite < ApplicationRecord

  belongs_to :user
  belongs_to :post_image
  
  #19　いいねは１度だけにバリデーション設定
  validates :user_id, uniqueness: {scope: :post_image_id}
  
end 