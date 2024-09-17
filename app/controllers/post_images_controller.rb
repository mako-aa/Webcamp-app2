class PostImagesController < ApplicationController
  def new
    @post_image = PostImage.new
  end

  #投稿データの保存
  def create
    #投稿するデータをモデルに紐づくデータとして保存する準備
    @post_image = PostImage.new(post_image_params)
    #保存するカラムの中身を操作することができる
    #current_user.idでログインユーザーのidを取得できる
    @post_image.user_id = current_user.id
    @post_image.save
    redirect_to post_images_path
  end
  
    
  def index
    @post_images = PostImage.all
  end

  def show
    
  end
  
  
  #投稿データのストロングパラメータ
  private
  
  def post_image_params
    params.require(:post_image).permit(:shop_name, :image, :caption)
  end
  
end
