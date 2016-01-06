class CreateUserProjects < ActiveRecord::Migration
  def change
    create_table :user_projects do |t|

      t.timestamps null: false
      t.belongs_to :user, index: true
      t.belongs_to :project, index: true
      t.integer :status
    end
  end
end
