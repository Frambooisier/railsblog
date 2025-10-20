class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: [:steam]

  def self.from_omniauth(auth)
    where(uid: auth.uid, provider: auth.provider).first_or_create do |user|
      user.email = "#{auth.uid}@steam.local" # Steam doesn’t give emails
      user.password = Devise.friendly_token[0, 20]
    end
  end
end
