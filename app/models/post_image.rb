class PostImage < ApplicationRecord
  
  has_one_attached :image
  belongs_to :user
  #18複数のpost_commentsが関連付けされている
  has_many :post_comments, dependent: :destroy
  #19
  has_many :favorites, dependent: :destroy
  
  #21バリデーションの
  validates :shop_name, presence: true
  validates :image, presence: true
  
  
  #一覧機能で画像を表示、Railsで画像のサイズ変更をする
  def get_image
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end 
    image
  end

  #19引数で渡されたユーザidがテーブル内に存在するかどうか
  def favorited_by?(user)
    favorites.exists?(user_id: user.id)
  end 
  
end
