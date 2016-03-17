class BookmarksController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def show
    @topic = Topic.find(params[:topic_id]) #this line might be unnecessary, could do @bookmark.topic
    @bookmark = Bookmark.find(params[:id])
  end

  def new
    @topic = Topic.find(params[:topic_id])
    @bookmark = Bookmark.new
    authorize @bookmark
  end

  def create
    @topic = Topic.find(params[:topic_id])
    @bookmark = @topic.bookmarks.build(bookmark_params)
    @bookmark.user = current_user
    authorize @bookmark

    if @bookmark.save
      flash[:notice] = "Bookmark saved"
      redirect_to [@topic, @bookmark]
    else
      flash[:alert] = "Something went wrong"
      render :new
    end
  end

  def edit
    @bookmark = Bookmark.find(params[:id])
    authorize @bookmark
  end

  def update
    @bookmark = Bookmark.find(params[:id])
    authorize @bookmark

    if @bookmark.update(bookmark_params)
      flash[:notice] = "Updated Bookmark"
      redirect_to [@bookmark.topic, @bookmark]
    else
      flash[:alert] = "Something went wrong"
      render :edit
    end
  end

  def destroy
    @bookmark = Bookmark.find(params[:id])
    authorize @bookmark
    @bookmark.destroy
    flash[:notice] = "Bookmark Deleted"
    redirect_to @bookmark.topic
  end

  private
  def bookmark_params
    params.require(:bookmark).permit(:url)
  end

end
