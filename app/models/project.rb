class Project < ActiveRecord::Base

  has_many :user_projects
  has_many :users, through: :user_projects

  has_many :project_skills
  has_many :skills, through: :project_skills

  accepts_nested_attributes_for :skills, reject_if: :all_blank, allow_destroy: true
  accepts_nested_attributes_for :project_skills

  belongs_to :project_category
  belongs_to :user
  belongs_to :skill

  validates :name, presence: true
  validates :public_description, presence: true
  validates :private_description, presence: true
  validates :project_category, presence: true

end
