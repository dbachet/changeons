class Link < ActiveRecord::Base
  belongs_to :user
  validates :name, uniqueness: true, presence: true
  validates :url, uniqueness: true, presence: true
end
