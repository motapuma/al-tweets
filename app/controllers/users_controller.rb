class UsersController < ApplicationController

  before_action :authenticate_user!
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def my_tweets
    
    @user_tweets =  current_user.nil? ? [] : current_user.tweets_with_retweets  

  end

  def faveds
      @faveds = current_user.faveds
  end

  def timeline
    @timeline_tweets = current_user.timeline_tweets
  end

  def follow
    exito = false

    follower_id  = params[:follower_id]
    following_id = params[:following_id]
    to_unfollow  = params[:to_unfollow]

    if User.exists?(follower_id) && User.exists?(following_id)
      follower  = User.find(follower_id)
      following = User.find(following_id)
      
      

      if to_unfollow == "false"
        following.followers << follower
      else
        following.followers.delete(follower)
      end

      exito = true if following.save

    end

    respond_to do |format|
      if exito
        format.html { redirect_to :back, notice: 'Following' }
        format.js{ }
      else
        format.js{ alert("Imposible Seguir"); }
        format.html { redirect_to :back, notice: 'Imposible Seguir' }
      end
    end



  end

  def met_people
    @users = User.all
  end

  # GET /users
  # GET /users.json
  def index
    @users = User.all
  end

  # GET /users/1
  # GET /users/1.json
  def show
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to edit_user_path(@user), notice: 'User creado' }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to edit_user_path(@user), notice: 'User Actualizado' }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json

  def destroy
    @user.destroy

    respond_to do |format|
      format.html { redirect_to ucer_url, notice: 'User eliminado' }
      format.json { head :no_content }
    end

  end

  private
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:name,:bio,:mail)
    end
end
