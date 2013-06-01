class Link < ActiveRecord::Base
  DISQUS_IDENTIFIER = 'link'
  belongs_to :category

  belongs_to :user
  LANGUAGES = ['FR', 'EN']
  validates :name, uniqueness: true, presence: true
  validates :url, uniqueness: true, presence: true
  validates :language, presence: true, inclusion: { in: LANGUAGES }
  validates :category, presence: true
end
