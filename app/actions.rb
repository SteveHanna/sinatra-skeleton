# Homepage (Root path)
get '/' do
  erb :index
end

get '/articles' do
  if session[:user_id]
    @articles = Article.all
    erb :'articles/index'
  else
    redirect :signup
  end
end

get '/signup' do
  erb :signup
end

get '/logout' do
  session[:user_id] == nil
end

post '/signup' do
  if params[:password] == params[:password_confirmation]
    user = User.create(
      email: params[:email],
      password: params[:password]
    )
    
    session[:user_id] = user.id
    redirect '/articles'
  end
end
