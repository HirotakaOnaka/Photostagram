class LikesController < ApplicationController
  def create
    like = current_user.likes.create(post_id: params[:post_id])
    redirect_to posts_url, notice: "LIKEしました"
  end

  def destroy
    like = current_user.likes.find_by(id: params[:id]).destroy
    redirect_to posts_url, notice: "LIKEを外しました"
  end
end
