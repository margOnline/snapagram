class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :snaps, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :notifications, dependent: :destroy

  validates :username, presence: true, length: {maximum: 25}

  acts_as_voter

  def has_unread_notifications?
    notifications.any?{|n| n.unread?}
  end
end
