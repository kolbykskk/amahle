
class Parse::User < Parse::Object
  # add additional properties

  # define a before save webhook for Parse::User
  # webhook :before_save do
  #   obj = parse_object # Parse::User
  #   # make changes to record....
  #   obj # will send the proper changelist back to Parse-Server
  # end

end

class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
    end
  end
end