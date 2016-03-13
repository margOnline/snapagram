class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :snap

  validates :content, length: {minimum: 3, maximum: 300}
end
