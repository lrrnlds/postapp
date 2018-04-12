@@database = Temp_Database.instance

get '/' do
  { post: {
    'http://127.0.0.1:9393/sign_up' => 'email',
    'http://127.0.0.1:9393/sign_in' => 'email, ' 'access_token'
    }
  }.to_json
end

post '/sign_up' do
  puts params['email']
  access_token = User_Record.create(params['email'])
  { access_token: access_token}.to_json
end

post '/sign_in' do
  puts params['email']
  puts params['access_token']

  if User_Record.sign_in(params['email'], params['access_token'])
    { yes: 'Successfully signed in'}.to_json
  else
    { no: 'nope'}.to_json
  end
end
