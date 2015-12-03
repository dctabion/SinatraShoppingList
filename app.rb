require 'bundler'
Bundler.require

get '/' do
  erb :home
end

get '/login' do
  erb :login
end

post '/login_validation' do
  p params
  #binding.pry
  # TODO replace this dummy logic

  # if (params[:email] == "" && params[:login] == "")
  #   p 'olo'
  #   return erb :login_fail
  #
  # end
  #
  # p 'fuckit'
  # return erb :login_success

  if (params[:email] != "" && params[:login] != "")
    @email = params[:email]
    erb :login_success
  else
    erb :login_fail
  end
end

get '/registration' do
  erb :registration
end

post '/registration_validation' do
  puts params
  reg_status = 'Developer made a mistake!'

  # ??? TODO add check if valid email address

  # check if password is not empty & if passwords match
  if params[:password] != ''
    p 'password is not empty'
    if params[:password] == params[:password_conf]
      p 'passwords match'
      @email = params[:email]
      erb :registration_success
    # invalid: password & password confirmation DO NOT match
    else
      @reg_status = 'Password & confirmation DO NOT match!'
      erb :registration_fail
    end
  else
    @reg_status = 'Invalid password!'
    erb :registration_fail
  end

end


get '/list' do
  erb :list
end
