Inatra.routes do
  get '/hello' do
    [200, {}, ['Hello World']]
  end

  post '/hello1' do
    [200, {}, ['Hello World2']]
  end
end