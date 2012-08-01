class CommentsController < ApplicationController
  include UrlHelper

  before_filter :find_post, :except => [:new]

  def index
    redirect_to(post_path(@post))
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
    @comment = Comment.new params[:comment]
    @comment.post = @post
    if simple_captcha_valid? and @comment.save
      redirect_to post_path(@post)
    else
      flash[:error] = "Your captcha code is wrong !"
      render :template => 'posts/show'
    end
  end

  protected

  def find_post
    @post = Post.find params[:post_id]
  end
end
