class PostImage < ApplicationRecord
  
  has_one_attached :image
  belongs_to :user
  
  
  #一覧機能で画像を表示、Railsで画像のサイズ変更をする
  def get_image
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end 
    image
  end

end
