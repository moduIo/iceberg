class CreateSkills < ActiveRecord::Migration
  def change
    create_table :skills do |t|

      t.timestamps null: false
      t.string :skill
      t.references :skill_category

    end
  end
end
