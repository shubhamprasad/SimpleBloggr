class TagsController < ApplicationController
  before_filter :authorize
  def index
  end
  def show
  	@tag = Tag.find(params[:id])
  	@posts = @tag.posts
  end
  def new
  end
  def create
  	@tag = Tag.new(tag_params)
  	@tag.save
  	redirect_to new_user_post_path(current_user)
  end
  def tag_params
    params.require(:tag).permit(:name)
  end
end
