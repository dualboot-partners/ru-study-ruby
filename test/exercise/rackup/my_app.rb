Inatra.routes do
  get '/hello' do
    [200, {}, ['Hello World']]
  end

  get '/ping' do
    [200, {}, ['PONG']]
  end

  post '/bye' do
    [200, {}, ['Bye Bye']]
  end
end
