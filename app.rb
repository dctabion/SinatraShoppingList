require 'bundler'
Bundler.require

ActiveRecord::Base.establish_connection(
  :database => 'shopping_list',
  :adapter => 'postgresql'
)

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


get '/item_read' do
  @status_msg = params[1]
  @items = Item.all
  erb :item_read
end

post '/item_add' do
  erb :item_add_form
  # redirect '/item_read'
end

post '/item_add_validate' do
  # TODO add validation to this!!!
  item = Item.new
  item.name = params[:name]
  item.quantity = params[:quantity].to_i
  item.save
  @status_msg = 'Your item was added.'
  redirect '/item_read'
end

post '/item_update' do
  erb :item_update
end

post '/item_delete' do
  item = Item.find(params[:id])
  item.destroy
  redirect '/item_read'
end
