require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "soup"
  end

  get "/" do
    erb :index
  end

  helpers do

    def current_user
      @user = User.find_by_id(session[:user_id])
    end

    def is_logged_in?
      !!current_user
    end

    # def redirect_if_not_logged_in
    #   if !logged_in?
    #     redirect "/login?error=You have to be logged in to do that"
    #   end
    # end

  end

end
