class Snap < ActiveRecord::Base
  has_attached_file :image, styles: {large: "640x", medium: "300x300", thumb: "100x100"}, default_ur: "/images/:style/missing.png"

  belongs_to :user
  has_many :comments, dependent: :destroy

  accepts_nested_attributes_for :comments

  validates :user_id, presence: true
  validates_attachment :image, presence: true
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
end
