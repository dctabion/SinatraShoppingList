require 'bundler'
Bundler.require

get '/' do
  erb :home
end

get '/login' do
  erb :login
end

get '/registration' do
  erb :registration
end

post '/registration_validation' do
  puts params
  reg_status = 'Developer made a mistake!'

  # ??? TODO add check if valid email address
  # ??? TODO add check if passwords are not null or too long

  # check if passwords
  # valid: passwords & password confirmation match
  if params[:password] != ''
    p 'password is not empty'
    if params[:password] == params[:password_conf]
      p 'passwords match'
      @email = params[:email]
      erb :registration_success
    # invalid: password & password confirmation DO NOT match
    elsif
      @reg_status = 'Password & confirmation DO NOT match!'
      erb :registration_fail
    end
  elsif
    @reg_status = 'Invalid password!'
    erb :registration_fail
  end

end


get '/list' do
  erb :list
end
