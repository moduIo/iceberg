class CreateProjectSkills < ActiveRecord::Migration
  def change
    create_table :project_skills do |t|

      t.timestamps null: false
      t.belongs_to :project, index: true
      t.belongs_to :skill, index: true
    end
  end
end
