class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :comment_text
      t.string :commentable_type
      t.integer :commentable_id
      t.integer :poster_id

      t.timestamps
    end
  end
end
