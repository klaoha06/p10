get '/' do
  erb :index
end

get '/log_in' do
  redirect to("https://www.facebook.com/dialog/oauth?client_id=#{APP_ID}&redirect_uri=#{REDIRECT_URI}&scope=user_friends")
end

get '/auth' do
  if params[:code]
  	response = HTTParty.get("https://graph.facebook.com/oauth/access_token?client_id=#{APP_ID}&redirect_uri=#{REDIRECT_URI}&client_secret=#{APP_SECRET}&code=#{params[:code]}")
    p response
    p response.parsed_response

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