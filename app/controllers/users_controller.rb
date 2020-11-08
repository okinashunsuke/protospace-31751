class UsersController < ApplicationController

 def show
  
  @user = User.find(params[:id])
  @name = @user.name
  @profile = @user.profile
  @occupation = @user.occupation
  @position = @user.position
  @prototypes = @user.prototypes


  # @prototypes = Prototype.find(params[:id] = prototype_id)
  # @tweets = user.tweets
  # @user = User.find(params[:id])
  # @name = @user.name
  # @prototypes = @user.prototypes
  # @prototype = Prototype.find(params[:id])
  end

  # @user = User.find_by(id: @prototype.user_id)

#  def index
#     @prototype = Prototype.find(params[:id])
#     @comment = Comment.new
#     @comments = @prototype.comments.includes(:user)
#     @user = User.find_by(id: @prototype.user_id)
#  end

end