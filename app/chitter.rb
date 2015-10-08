require 'sinatra/base'
require 'sinatra/session'
require 'sinatra/flash'
require_relative "../data_mapper_setup"
require_relative "./models/user"
require_relative "./models/peep"

class Chitter < Sinatra::Base


  enable :sessions
  set :session_secret, "super secret"
  register Sinatra::Flash
  use Rack:: MethodOverride

  get '/' do
    'Hello Chitter!'
    erb :home
  end

  get '/users/new' do
    @user = User.new
    erb :'users/new'
  end

  post '/users' do
    @user = User.new(
      email: params[:email],
      password: params[:password],
      password_confirmation: params[:password_confirmation])
    if @user.save
      session[:user_id] = @user.id
      redirect to('/')
    elsif User.first(:email => @user.email)
      flash.now[:notice] = 'Email already registered'
    elsif @user.email == ''
      flash.now[:notice] = 'Please enter a valid email address'
    else
      flash.now[:notice] = 'Password and confirmation password do not match'
    end
    erb :'users/new'
  end

  get '/sessions/new' do
    erb :'/sessions/new'
  end

  post '/sessions' do
    user = User.authenticate(params[:email], params[:password])
    if user
      session[:user_id] = user.id
      redirect to('/')
    else
      flash.now[:notice] = 'Email or password incorrect'
      erb :'/sessions/new'
    end
  end

  delete '/sessions' do
    session[:user_id] = false
    redirect to ('/')
  end

  get '/peeps' do
    @peeps = Peep.all
    erb :'peeps/index'
  end

  get '/peeps/new' do
    erb :'peep'
  end

  post '/peeps' do
    Peep.create(content: params[:content])
    redirect to('/peeps')
  end


  helpers do
    def current_user
      User.get(session[:user_id])
    end
  end






  # start the server if ruby file executed directly
  run! if app_file == $0
end
