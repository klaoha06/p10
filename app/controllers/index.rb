get '/' do
  redirect '/fTinder'
end

get '/fTinder' do
	erb :index
end

get '/log_in' do
  redirect to("https://www.facebook.com/dialog/oauth?client_id=#{APP_ID}&redirect_uri=#{REDIRECT_URI}&scope=user_friends,user_photos,read_friendlists")
end

get '/auth' do
  if params[:code]
  	response = RestClient.get("https://graph.facebook.com/oauth/access_token?client_id=#{APP_ID}&redirect_uri=#{REDIRECT_URI}&client_secret=#{APP_SECRET}&code=#{params[:code]}")
    p1 = response.split('&')
    p2 = p1.first.split('=')
    access_token = p2[1]

    @graph = Koala::Facebook::API.new(access_token)

    p profile = @graph.get_object("me")
    p friends = @graph.get_connections("me", "friends")
    p friends = @graph.get_connections("me", "friendlists" )

    # p response.parsed_response

    # erb :test
  else
  #   redirect '/'
  end
end

# def get_sweet_access_token(code)
  # response = HTTParty.get("https://graph.facebook.com/oauth/access_token?client_id=#{APP_ID}&redirect_uri=#{REDIRECT_URI}&client_secret=#{APP_SECRET}&code=#{code}")
#   # p response[:expires]
#   # p response
#   p response[:access_token]
# end