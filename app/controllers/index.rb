get '/' do
  erb :index
end

get '/log_in' do
	p APP_ID
	p "--" * 10
  redirect to("https://www.facebook.com/dialog/oauth?client_id=#{APP_ID}&redirect_uri=#{REDIRECT_URI}&scope=user_friends")
end

get '/auth' do
	p params
	p params[:code]
  # if params[:code]
  #  	get_sweet_access_token(params[:code])
  #   # erb :test
  # else
  #   redirect '/'
  # end
end

# def get_sweet_access_token(code)
#   response = HTTParty.get("https://graph.facebook.com/oauth/access_token?client_id=#{APP_ID}&redirect_uri=#{REDIRECT_URI}&client_secret=#{APP_SECRET}&code=#{code}")
#   # p response[:expires]
#   # p response
#   p response[:access_token]
# end