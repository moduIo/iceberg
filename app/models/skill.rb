class Skill < ActiveRecord::Base

  has_many :project_skills
  has_many :projects, through: :project_skills
  has_many :user_skills
  has_many :users, through: :user_skills

  belongs_to :user
  belongs_to :project
end
