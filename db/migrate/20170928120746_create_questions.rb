class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string :question_text
      t.integer :poster_id
      t.integer :best_answer_id

      t.timestamps
    end
  end
end
