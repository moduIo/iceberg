class User < ActiveRecord::Base
	# Include default devise modules. Others available are:
	# :confirmable, :lockable, :timeoutable and :omniauthable
	devise :database_authenticatable, :registerable,
	     :recoverable, :rememberable, :trackable, :validatable

	validates :email, presence: true, :length => {in: 5..255}, :email => true,
            uniqueness: true

   validates :username, presence: true, length: {in: 5..50}, uniqueness: true

  has_many :sent_messages, class_name: "Message", foreign_key: "sender_id"
  has_many :received_messages, class_name: "Message", foreign_key: "receiver_id"

  has_many :user_projects
  has_many :projects, through: :user_projects

  has_many :user_skills
  has_many :skills, through: :user_skills

  accepts_nested_attributes_for :skills, reject_if: :all_blank, allow_destroy: true
  accepts_nested_attributes_for :user_skills

  belongs_to :project
  belongs_to :skill

end # end class User
