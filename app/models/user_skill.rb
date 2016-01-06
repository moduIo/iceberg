class UserSkill < ActiveRecord::Base

  belongs_to :user
  belongs_to :skill
  accepts_nested_attributes_for :skill, :reject_if => :all_blank

  validates :skill_id, uniqueness: true
end
