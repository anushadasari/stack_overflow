class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.text :content
      t.references :user, index: true

      t.timestamps null: false
      t.integer :upvotes
      t.integer :downvotes
    end
    add_index :questions, [:user_id, :created_at]
  end
end
