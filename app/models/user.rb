class User < ActiveRecord::Base
	validates :name, presence: true
	validates :email, presence: true, uniqueness: true
	validates :email, format: { with: /\A\S*@\S*\W\S*\z/, message: "must be a valid email"}
	validates :password, presence: true
	validates :password, format: { with: /\A\S{6,}\z/, message: "is too short (minimum is 6 characters)"}
	validates :password, format: { with: /\A\S{,20}\z/, message: "is too long (maximum is 20 characters)"}
	validates :password_confirmation, presence: true 
	validates_confirmation_of :password
	has_many :statuses, dependent: :destroy
	has_many :likes, dependent: :destroy
end
