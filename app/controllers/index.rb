get '/' do
  erb :index
end

post '/urls' do
  @url = Url.where(url: params[:url]).first
  if @url.nil?
    @url = Url.new(url: params[:url])
    @url.save
  end
  erb :index
end

get '/:short_url' do
  @url = Url.where(short_url: params[:short_url]).first
  @url.click_count += 1
  @url.save

  redirect "http://" + @url.url
end

