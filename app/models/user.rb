class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :snaps, dependent: :destroy
  has_many :comments, dependent: :destroy

  validates :username, presence: true, length: {miniumum: 4, maximum: 25}
end
