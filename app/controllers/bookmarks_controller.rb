class BookmarksController < ApplicationController

  load_and_authorize_resource

  respond_to :html, :js

  def load_link
    @url = params[:url]
    @link = Linkser.parse @url     
    puts @link.inspect
    respond_with do |format|
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
    Bookmark.delete params[:id]
    redirect_to bookmarks_path
  end
end
