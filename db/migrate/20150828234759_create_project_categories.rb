class CreateProjectCategories < ActiveRecord::Migration
  def change
    create_table :project_categories do |t|

      t.timestamps null: false
      t.string :project_category, index: true
    end
  end
end
