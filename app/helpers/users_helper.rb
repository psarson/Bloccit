module UsersHelper
  def user_posts_or_comments?(user)
    user.comments.any? || user.posts.any? 
  end
end
