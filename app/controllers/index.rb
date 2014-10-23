get '/' do
  erb :index
end

get '/log_in' do
  redirect to("https://www.facebook.com/dialog/oauth?client_id=#{APP_ID}&redirect_uri=#{REDIRECT_URI}&scope=user_friends")
end

get '/auth' do
  if params[:code]
    @access_token = get_sweet_access_token(params[:code])
    erb :test
  else
    # p "got some params or something"
    # p params
  end
end

def get_sweet_access_token(code)
  response = HTTParty.get("https://graph.facebook.com/oauth/access_token?client_id=#{APP_ID}&redirect_uri=#{REDIRECT_URI}&client_secret=#{APP_SECRET}&code=#{code}")
  response[:access_token]
end