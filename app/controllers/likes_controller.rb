class LikesController < ApplicationController
  before_action :set_likable

  def create
    @like = @likable.likes.new(user: current_user)

    if @like.save
      render json: { liked: true, like_count: @likable.likes.count, like_id: @like.id }
    else
      render json: { error: "Unable to like." }, status: 422
    end
  end

  def destroy
    @like = Like.find(params[:id]) # Use the ID from the URL to find the specific Like instance
    if @like.user == current_user  # Optional check to ensure the current user owns the like
      @like.destroy
      render json: { liked: false, like_count: @likable.likes.count, like_id: nil }
    else
      render json: { error: "Not authorized." }, status: 403
    end
  end


  private

  def set_likable
    @likable =
      if params[:comment_id]
        Comment.find(params[:comment_id])
      elsif params[:article_id]
        Article.find(params[:article_id])
      elsif params[:id] && action_name == "destroy"
        Like.find(params[:id]).likable  # Fetch the 'likable' for the like being deleted
      else
        redirect_to root_path, alert: 'Invalid request'
        return
      end
  end
end
