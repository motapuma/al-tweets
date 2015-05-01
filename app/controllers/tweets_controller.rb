class TweetsController < ApplicationController

  before_action :set_tweet, only: [:show, :edit, :update, :destroy]

  def retweet
    exito = false

    user_id  = params[:user_id]
    tweet_id = params[:tweet_id]
    to_unretweet  = params[:to_unretweet]

    if User.exists?(user_id) && Tweet.exists?(tweet_id)
      user   = User.find(user_id)
      tweet  = Tweet.find(tweet_id)
      

      if to_unretweet == "false"
        user.retweets << tweet
      else
        user.retweets.delete(tweet)
      end

      exito = true if user.save

    end

    respond_to do |format|
      if exito
        format.html { redirect_to :back, notice: 'Faved' }
        
      else
        format.js{ alert("Imposible Favear"); }
        
      end
    end
  
  end


  def fav

    exito = false

    user_id  = params[:user_id]
    tweet_id = params[:tweet_id]
    to_unfav  = params[:to_unfav]

    if User.exists?(user_id) && Tweet.exists?(tweet_id)
      user   = User.find(user_id)
      tweet  = Tweet.find(tweet_id)
      

      if to_unfav == "false"
        user.faveds << tweet
      else
        user.faveds.delete(tweet)
      end

      exito = true if user.save

    end

    respond_to do |format|
      if exito
        format.html { redirect_to :back, notice: 'Faved' }
        
      else
        format.js{ alert("Imposible Favear"); }
        
      end
    end


  end

  # GET /tweets
  # GET /tweets.json
  def index
    @tweets = Tweet.all
  end

  # GET /tweets/1
  # GET /tweets/1.json
  def show
  end

  # GET /tweets/new
  def new
    @tweet = Tweet.new
  end

  # GET /tweets/1/edit
  def edit
  end

  # POST /tweets
  # POST /tweets.json
  def create
    @tweet = Tweet.new(tweet_params)
    binding.pry
    respond_to do |format|
      if @tweet.save
        format.html { redirect_to edit_tweet_path(@tweet), notice: 'Tweet creado' }
        format.js{}
      else
        format.html { render :new }
        format.js{ alert("Tweet Inválido");}
      end
    end
  end

  # PATCH/PUT /tweets/1
  # PATCH/PUT /tweets/1.json
  def update
    respond_to do |format|
      if @tweet.update(tweet_params)
        format.html { redirect_to edit_tweet_path(@tweet), notice: 'Tweet Actualizado' }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /tweets/1
  # DELETE /tweets/1.json

  def destroy
    @tweet.destroy

    respond_to do |format|
      format.html { redirect_to ucer_url, notice: 'Tweet eliminado' }
      format.json { head :no_content }
    end

  end

  private
    def set_tweet
      @tweet = Tweet.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tweet_params
      params.require(:tweet).permit(:tweet_text,:user_id,:quote_tweet)
    end
end
