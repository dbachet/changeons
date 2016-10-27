class Category < ActiveRecord::Base
  has_many :links

  validates :name, presence: true, uniqueness: {case_sensitive: false}
end
