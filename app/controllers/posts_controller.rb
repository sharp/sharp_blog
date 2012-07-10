class PostsController < ApplicationController
  
  before_filter :login_required, :except => [:index, :show]
  def index
    if params[:tag]
      @posts = Post.tagged_with(params[:tag]).order("published_at desc").page(params[:page])
    else
      @posts = Post.order("published_at desc").page(params[:page])
    end
    respond_to do |format|
      format.html
      format.atom { render :layout => false }
    end
  end
  
  def new
    @post = Post.new
  end

  def show
    @post = Post.find params[:id]
    views_count = @post.views_count + 1
    @post.views_count = views_count unless session[:login]
    @post.save
    @comment = Comment.new
  end
  
  def create
    @post = Post.new(params[:post])
    if @post.save
      respond_to do |format|
        format.html {
          flash[:notice] = "Created post '#{@post.title}'"
          redirect_to(:action => 'show', :id => @post)
        }
      end
    else
      respond_to do |format|
        format.html { render :action => 'new', :status => :unprocessable_entity }
      end
    end
  end
  
  def edit
    @post = Post.find params[:id]
  end

  def update
    @post = Post.find params[:id]
    if @post.update_attributes(params[:post])
      respond_to do |format|
        format.html {
          flash[:notice] = "Updated post '#{@post.title}'"
          redirect_to(:action => 'show', :id => @post)
        }
      end
    else
      respond_to do |format|
        format.html { render :action => 'show', :status => :unprocessable_entity }
      end
    end
  end
  
end
