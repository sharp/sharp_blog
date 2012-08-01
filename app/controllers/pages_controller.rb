require 'base64'
class PagesController < ApplicationController
  #layout :resume, :only => "resume"
  def show
    @page = Page.find_by_slug(params[:id]) || raise(ActiveRecord::RecordNotFound)
  end

  def resume
    redirect_to root_path
    if params[:date] and 2.weeks.ago < Base64.decode64(params[:date]).to_date 
      render :template => "pages/resume_#{params[:type]}", :layout => "resume" 
    else
      redirect_to root_path
    end
  rescue
    redirect_to root_path
  end
end
