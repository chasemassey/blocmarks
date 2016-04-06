class LikesController < ApplicationController

  def index
    respond_with({:msg => "success"})
  end

  def create
    @bookmark = Bookmark.find(params[:bookmark_id])
    like = current_user.likes.build(bookmark_id: @bookmark.id)

    if like.save
      flash[:success] = "You like this bookmark!"
      redirect_to [@bookmark.topic, @bookmark]
    else
      flash[:alert] = "Something went wrong. Let's try that again."
      redirect_to [@bookmark.topic, @bookmark]
    end
  end

  def destroy
    @bookmark = Bookmark.find(params[:bookmark_id])
    like = @bookmark.likes.where(user_id: current_user.id).first

    if like.destroy
      flash[:success] = "You unliked this bookmark."
      redirect_to [@bookmark.topic, @bookmark]
    else
      flash[:alert] = "Something went wrong. Let's try that again."
      redirect_to [@bookmark.topic, @bookmark]
    end
  end
end
