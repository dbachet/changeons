class Link < ActiveRecord::Base
  belongs_to :category

  belongs_to :user
  LANGUAGES = ['FR', 'EN']
  validates :name, uniqueness: true, presence: true
  validates :url, uniqueness: true, presence: true
  validates :language, presence: true, inclusion: { in: LANGUAGES }
end
