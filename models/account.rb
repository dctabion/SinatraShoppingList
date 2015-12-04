class Account < ActiveRecord::Base
  include BCrypt

  # password setter will store hashed password in password_digest
  def password=(pwd)
    self.password_digest = BCrypt::Password.create(pwd)
  end

  # password getter will return unhashed version of password_digest
  def password
    return BCrypt::Password.new(self.password_digest)
  end

  # handle authentication
  # if find user and password matches, return user
  # otherwise return nil
  def self.authenticate(username, password)
    # get user object
    current_user = Account.find_by(user_name: username)

    # if user exists & password param matches password in database
    if current_user != nil
      if current_user.password == password
        return current_user
      else
        # password doesn't match
        return nil
      end
    # couldn't find username in database
    return nil
    end
  end

end
