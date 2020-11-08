class PrototypesController < ApplicationController
  
  # before_action :authenticate_user!, only: [:index]
  protect_from_forgery :except => [:destroy]
  before_action :move_to_index, except: [:index, :show,]
  
  def index
    @prototypes = Prototype.all
  end
  
  def new
    @prototype = Prototype.new
  end

  def create
    @prototype = Prototype.create(prototype_params) 
    if @prototype.save
     redirect_to root_path
    else
     render :new
    end
  end

  def show
   @prototype = Prototype.find(params[:id])
   @comment = Comment.new
   @comments = @prototype.comments.includes(:user)
  #  @user = User.find_by(id: @prototype.user_id)
  end

  def edit
    @prototype = Prototype.find(params[:id])
    #@user = User.find_by(id: @prototype.user_id)
  end

  def update
    prototype = Prototype.find(params[:id])
    if prototype.update(prototype_params)
      redirect_to prototype_path#(@prototype.id)
    else
      render :edit  
    end
  end

  def destroy
    prototype = Prototype.find(params[:id])
    prototype.destroy
    redirect_to root_path
  end



  private
  def prototype_params
    params.require(:prototype).permit(:title, :image, :catch_copy,:concept).merge(user_id: current_user.id)
  end

  def move_to_index
    @prototype = Prototype.find(params[:id])
    unless user_signed_in? && current_user.id == @prototype.user_id
      redirect_to action: :index
    end
  end

end


