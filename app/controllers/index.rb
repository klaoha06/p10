get '/' do
  erb :index
end

get '/log_in' do
  redirect to("https://www.facebook.com/dialog/oauth?client_id=#{APP_ID}&redirect_uri=#{REDIRECT_URI}")
end

get '/auth' do
	p params
  # if params[:code]
  #   p get_sweet_access_token(params[:code])
  # else
  #   p "got some params or something"
  #   p params
  # end
end

def get_sweet_access_token(code)
  # p HTTParty.get("https://graph.facebook.com/oauth/access_token?client_id=#{APP_ID}&redirect_uri=#{REDIRECT_URI}&client_secret=#{APP_SECRET}&code=#{code}")
end