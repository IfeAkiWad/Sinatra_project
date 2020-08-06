require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, ENV["SESSION_SECRET"]
  end

  get '/' do
    erb :welcome
  end

  helpers do #class
    def logged_in? #should return true if the user_id is in the session hash and false if not. 
			!!session[:user_id] # helper method to only display the username and account balance if the user is logged in.
    end
    
    def current_user #finds user in the database and returns user
      # binding.pry
			@current_user = User.find_by_id(session[:user_id]) #to display the username and balance.
		end
  end



  

end
