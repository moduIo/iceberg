class CreateSkillCategories < ActiveRecord::Migration
  def change
    create_table :skill_categories do |t|

      t.timestamps null: false
      t.string :category, index: true
    end
  end
end
