class BookmarksController < ApplicationController

  def index
    @bookmark = Bookmark.all
  end

  def show
    @bookmark = Bookmark.find(params[:id])
  end

  def new
    @topic = Topic.find(params[:topic_id])
    @bookmark = Bookmark.new
  end

  def create
    @topic = Topic.find(params[:topic_id])
    @bookmark = Bookmark.new(bookmark_params)
    @bookmark.topic = @topic
    @bookmark.user = current_user
    if @bookmark.save
      flash[:notice]= "The bookmark was saved."
      redirect_to [@topic, @bookmark]
    else
      flash.now[:error]= "The bookmark was not saved. Please try again."
      render :new
    end
  end

  def edit
    @topic = Topic.find(params[:topic_id])
    @bookmark = Bookmark.find(params[:id])
    @bookmark.save
  end

  def update
    @topic = Topic.find(params[:topic_id])
    @bookmark = Bookmark.find(params[:id])
    @bookmark.assign_attributes(bookmark_params)
    authorize @bookmark
    if @bookmark.save
      flash[:notice]= "The bookmark was updated."
      redirect_to [@bookmark.topic, @bookmark]
    else
      flash[:error]= "The bookmark was not updated. Please try again."
      render :edit
    end
  end

  def destroy
    @bookmark = Bookmark.find(params[:id])
    authorize @bookmark
    if @bookmark.destroy
      flash[:notice]= "\"#{@bookmark.name}\" was deleted successfully."
      redirect_to @bookmark.topic
    else
      flash[:error]= "There was an error in deleting the bookmark."
      render :show
    end
  end


  def bookmark_params
    params.require(:bookmark).permit(:url, :name)
  end
end
