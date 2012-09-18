class CommentsController < ApplicationController
  include UrlHelper

  before_filter :find_post, :except => [:new, :index]

  def index
    @comments = Comment.order("created_at desc").page(params[:page])
  end

  def new
    @comment = Comment.build_for_preview(params[:comment])

    respond_to do |format|
      format.js do
        render :partial => 'comment.html.erb', :locals => {:comment => @comment}
      end
    end
  end

  def create
    if session[:login] or simple_captcha_valid?
      @comment = Comment.new params[:comment]
      if @post
         @comment.post = @post
         @comment.save
         redirect_to post_path(@post)
       else
         @comment.post_id = 0
         @comment.save
        redirect_to comments_path
      end
    else
      flash[:error] = "Your captcha code is wrong !"
      render :template => 'posts/show'
    end
  end

  protected

  def find_post
    if params[:post_id]
      @post = Post.find params[:post_id]
    else
      @post = nil
    end
  end
end
