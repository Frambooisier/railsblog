class BlogPostsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_blog_post, except: [:index, :new, :create]
  def index
    @blog_posts = user_signed_in? ? BlogPost.sorted : BlogPost.published
    @pagy, @blog_posts = pagy(@blog_posts)
    #rescue Pagy::OverflowError
    #redirect_to root_path(page: 1)

    # params[:page] = 1
    # retry
    #@blog_post = user_signed_in? ? BlogPost.all : BlogPost.published
    # old version was this:
    #@blog_posts = BlogPost.all #default one it just works cause it's simple
  end
  def show
    #@blog_post #= BlogPost.find(params[:id])
  end
  def new
    @blog_post = BlogPost.new
  end
  def create
    @blog_post=BlogPost.new(blog_post_params)
    if @blog_post.save
      redirect_to @blog_post
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @blog_post.destroy
    redirect_to root_path
  end

  def edit
    # @blog_post = BlogPost.find(params[:id])
  end
  def update
    @blog_post = BlogPost.find(params[:id])
    if @blog_post.update!(blog_post_params)
      redirect_to @blog_post
    else
      render 'edit', status: :unprocessable_entity
    end
  end
  private

  def blog_post_params
    params.require(:blog_post).permit(:title, :content, :published_at)
  end
  def set_blog_post
    @blog_post = user_signed_in? ? BlogPost.find(params[:id]) : BlogPost.published.find(params[:id])
      # just seting vairable so each instance lands here during requests I take @blog_post = BlogPost.find(params[:id])
    #rescue ActiveRecord::RecordNotFound
    #redirect_to root_path #status: :not_foundr

  end
end




