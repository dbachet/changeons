class Link < Share
  belongs_to :category
  belongs_to :user

  LANGUAGES = ['FR', 'EN']
  validates :name, uniqueness: true, presence: true, length: { maximum: 160 }

  validates :url,
    uniqueness: true,
    presence: true,
    length: { maximum: 2000 },
    format: { with: URI.regexp(%w(http https)), message: :invalid_url_format }

  validates :language, presence: true, inclusion: { in: LANGUAGES }
  validates :category, presence: true

  def self.disqus_category_id
    ENV["DISQUS_LINK_ID"]
  end

  def disqus_uniq_identifier
    "#{Rails.env}_LINK_#{id}"
  end
end
