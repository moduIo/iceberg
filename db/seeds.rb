# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'roo'

project_categories = ProjectCategory.create(
	[ { project_category: 'Technology'},
      { project_category: 'Arts'}, 
      { project_category: 'Science'},
      { project_category: 'Social'}, 
      { project_category: 'Mathematics'},
      { project_category: 'Construction'} ])

# Use roo to fill up skill and skill categories databases

xlsx = Roo::Spreadsheet.open('app/assets/spreadsheets/skill_list.xlsx')

xlsx.sheet(1).each do |row|
  Skill.create(skill:row[0], skill_category_id: row[2].to_i)
end

xlsx.sheet(0).each do |row|
  SkillCategory.create(category: row[0])
end



