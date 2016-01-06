class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|

      t.timestamps null: false
      t.string :name
      t.text :public_description
      t.text :private_description
      t.references :project_category
      t.references :user
    end
  end
end
