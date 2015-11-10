helpers do
  def current_user
    User.find(session[:user]) if session[:user]
  end
end

get '/' do



  current_user.songs.find(params[:song_id])
  upvotes = Upvote.where(user_id: current_user.id, song_id: song_id)






  erb :index
end

get '/messages/new' do
  erb :'messages/new'
end

get '/users/new' do
  @user = User.new
  erb :'users/new'
end

get '/login' do
  erb :'sessions/new'
end

post '/login' do
  user = User.find_by(username: params[:username])
  logged_in = user.authenticate(params[:password])

  if logged_in
    session[:user] = @user.id
    redirect '/'
  else
    @error = 'invalid username or password'
    erb :'sessions/new'
  end
end

get '/logout' do
  session.delete(:user)
  redirect '/'
end

post '/users' do
  @user = User.new(params)

  if @user.save
    session[:user] = @user.id
    redirect '/'
  else
    erb :'users/new'
  end
end
