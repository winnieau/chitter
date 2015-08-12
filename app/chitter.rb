require 'sinatra/base'
require 'sinatra/session'
require_relative "../data_mapper_setup"
require "./models/user"




class Chitter < Sinatra::Base

  set :views, proc { File.join(root, 'views') }

  enable :sessions
  set :session_secret, "super secret"

  get '/' do
    'Hello Chitter!'
    erb :home
  end

  get '/signup' do
    erb :signup
  end

  post '/signup' do
    user = User.create(email: params[:email],
      password: params[:password])
    session[:user_id] = user.id
    redirect to("/")
  end

  helpers do
    def current_user
      User.get(id: session[:user_id])
    end
  end
end



  # start the server if ruby file executed directly
  run! if app_file == $0
