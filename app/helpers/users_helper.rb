module UsersHelper
  def user_posts_or_comments?(user)
    user.comments.any? || user.posts.any?
  end

  def user_has_favorites?(user)
    user.favorites.count > 0
  end 
end
