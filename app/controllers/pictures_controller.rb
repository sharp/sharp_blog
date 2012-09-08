class PicturesController < ApplicationController
  def create

    @pic = Picture.new params[:picture]
    respond_to do |format|
      unless @pic.save
        flash[:error] = 'Photo could not be uploaded'
      end
      format.js do
        render :text => render_to_string(:partial => 'pictures/pic', :locals => {:photo => @photo})
      end
    end
  end
end
