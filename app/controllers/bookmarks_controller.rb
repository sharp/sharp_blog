class BookmarksController < ApplicationController

  respond_to :html, :js

  def index
    if params[:tag]
       @bookmarks = Bookmark.tagged_with(params[:tag]).order("published_at desc").page(params[:page])
    else     
       @bookmarks = Bookmark.order("published_at desc").page(params[:page])
    end
    respond_to do |format|        
      format.html
      format.atom { render :layout => false }
    end
  end


  def load_link
    @url = params[:url]
    @link = Linkser.parse @url     
    puts @link.inspect
    respond_to do |format|
      format.js
    end
  end

  def new
    bookmark = Bookmark.new
  end

  def create
    @bookmark = Bookmark.new(params[:bookmark])
    if @bookmark.save
      redirect_to bookmarks_path
    else
      respond_to do |format|
        format.html { render :action => 'new', :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @bookmark_id = params[:id]
    Bookmark.delete @bookmark_id
    respond_to do |format|
      format.js
    end
  end
end
