class PostsController < ApplicationController
	before_filter :authorize
 
  def index
    # @tags = Tag.new()
  	@posts = Post.all
  end
  def new
  	@tags = Tag.all
  end
  def create
  	post = Post.new(post_params)
  	tags = Tag.where(:id => params[:tag_ids])
  	tags.each do |t|
  		post.tags << t
  	end
  	
  	post.user_id = current_user.id
    if post.save
      redirect_to posts_path
    else
      redirect_to '/signup'
    end
  end
  private
  def post_params
    params.require(:post).permit(:title, :content,{:tag_ids => []})
  end
  # def tag_params
  #   params.require(:tag).permit(:name, :id)
  # end
end
