class Status < ActiveRecord::Base
	validates :title, presence: true, format: { with: /\A.{8,}\z/, message: "title is too short"}
	validates :content, presence: true, format: { with: /\A.{10,}\z/, message: "content is too short"}
	belongs_to :user
	has_many :likes, dependent: :destroy
	default_scope { order(created_at: :desc) }
end
