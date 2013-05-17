class Category < ActiveRecord::Base
  has_one :link

  validates :name, presence: true, uniqueness: {case_sensitive: false}
end