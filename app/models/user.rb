class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :omniauthable, :omniauth_providers => [:google_oauth2]

  def self.find_for_google_oauth2(access_token)
    data = access_token.info
    credentials = access_token.credentials
    user = User.where(:uid => access_token.uid).first

    if user
      user.update_attributes(token: credentials["token"])
    else
      user = User.create(uid: access_token.uid, email: data["email"], token: credentials["token"])
    end
    user
  end
end
