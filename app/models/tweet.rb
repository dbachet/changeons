class Tweet < Share
  validates :remote_id, uniqueness: true
end
