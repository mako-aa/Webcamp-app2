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
    
    #バリデーションによって変える
    if @post_image.save
      redirect_to post_images_path
    else
      render :new
    end 
    
  end
  
    
  def index
    #22 1ページ分の決められた数のデータだけを新しい順に取得する
    @post_images = PostImage.page(params[:page])
  end

#18 コメントを投稿するための変数を定義
  def show
    @post_image = PostImage.find(params[:id])
    @post_comment = PostComment.new
  end
  
  def destroy
    post_image = PostImage.find(params[:id])
    post_image.destroy
    redirect_to post_images_path
  end
  
  
  #投稿データのストロングパラメータ
  private
  
  def post_image_params
    params.require(:post_image).permit(:shop_name, :image, :caption)
  end
  
end
