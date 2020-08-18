require './config/environment'

class ApplicationController < Sinatra::Base #

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, ENV["SESSION_SECRET"]
    register Sinatra::Flash
  end

  get '/' do
    erb :welcome
  end

  helpers do #class
    def logged_in? #should return true if the user_id is in the session hash and false if not. 
			!!session[:user_id] # helper method to only display the user's name.
    end
    
    def current_user #finds user in the database and returns user
			@current_user = User.find_by_id(session[:user_id]) #to display the user's name and homepage.
		end
  end

  private
  def redirect_if_not_logged_in
      if !logged_in?
        redirect '/sessions/login'
      end
  end

  # private
  # def password_empty?
  #   if params[:password] == ""
      
  # end

  # private
  # def 
end
