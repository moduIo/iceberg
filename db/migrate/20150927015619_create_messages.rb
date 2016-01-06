class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|

      t.timestamps null: false
      t.text :content
      t.references :user
      t.integer :sender_id, index: true
      t.integer :receiver_id, index: true
      t.integer :project_id, index: true


    end
    add_index :messages, [:sender_id, :receiver_id, :created_at]
  end
end
