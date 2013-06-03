class Link < ActiveRecord::Base
  belongs_to :category

  belongs_to :user
  LANGUAGES = ['FR', 'EN']
  validates :name, uniqueness: true, presence: true
  validates :url, uniqueness: true, presence: true
  validates :language, presence: true, inclusion: { in: LANGUAGES }
  validates :category, presence: true

  def self.disqus_category_id
    ENV["DISQUS_LINK_ID"]
  end

  def disqus_uniq_identifier
    "#{Rails.env}_LINK_#{id}"
  end
end
