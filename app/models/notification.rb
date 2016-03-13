class Notification < ActiveRecord::Base
  belongs_to :user
  belongs_to :notified_by, class_name: "User"
  belongs_to :snap

  validates :user_id, :notified_by_id, :snap_id, :notice_type, presence: true

  def read?
    read
  end

  def unread?
    !read
  end
end
