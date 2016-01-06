class SkillCategory < ActiveRecord::Base

  has_many :skills
  accepts_nested_attributes_for :skills, reject_if: :all_blank,
    allow_destroy: true
end
