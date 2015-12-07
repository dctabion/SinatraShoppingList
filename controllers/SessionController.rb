class SessionController < ApplicationController


  get '/registration' do
     erb :registration
  end

  post '/registration' do
    puts params

    current_user = Account.find_by(user_name: params[:username])
    p current_user

    # current username doesn't exists
    if current_user == nil
      # selected password is not empty & the password matches password confirmation
      if ( params[:password] != nil ) && (params[:password] == params[:password_conf])
        # create database entry for user
        current_user = Account.new
        current_user.user_name = params[:username]
        current_user.user_email = params[:email]
        current_user.password = params[:password]
        current_user.is_admin = false
        current_user.save

        # save current user in session
        session[:current_user] = current_user

        # set status msg and redirect to shopping list
        @status_msg = 'Thanks for registering, ' + current_user.user_name + '!'
        p '-----------------registration successful------------------'
        # @items = session[:current_user].shopping_items
        # erb :item_read
        redirect '/item_read'

      else
        @status_msg = 'Invalid password or password doesn\'t match'
        erb :registration
      end
      # username already taken
    else
      @status_msg = 'Username taken already!'
      erb :registration
    end

  end



  get '/login' do
    erb :login
  end

  post '/login' do
    p params
    #binding.pry

    # Search for user base on username from form
    current_user = Account.find_by(user_name: params[:username])

    # Current user found
    if current_user != nil
      # Password matches database! Go to list!
      if current_user.password == params[:password]
        session[:current_user] = current_user
        @status_msg = "Welcome back, " + current_user.user_name + "!"
        # @items = session[:current_user].shopping_items
        # return erb :item_read
        redirect '/item_read'
      else
        @status_msg = "Invalid password!"
        return erb :login
      end

    # Current user not found
    else
      @status_msg = 'Username invalid!'
      return erb :login
    end
  end

  get '/logout' do
    session[:current_user]=nil
    erb :home
  end



end
