module ApplicationHelper
  def current_user_liked?(likable)
    # This checks if the current user has liked the given likable object (article/comment)
    likable.likes.exists?(user: current_user)
  end

  def current_user_like(likable)
    # This returns the like object associated with the current user for the given likable object (article/comment)
    likable.likes.find_by(user: current_user)
  end
end
