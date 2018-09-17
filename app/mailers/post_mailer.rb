class PostMailer < ApplicationMailer
  def post_mail(post)
    @post = post
    mail to: @post.user.email, subject:"写真の投稿が完了しました。"
  end
end
