class CreateUserSkills < ActiveRecord::Migration
  def change
    create_table :user_skills do |t|

      t.timestamps null: false
      t.belongs_to :user, index: true
      t.belongs_to :skill, index: true
    end
  end
end
