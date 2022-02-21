class CreateResponses < ActiveRecord::Migration[7.0]
  def change
    create_table :responses do |t|
      t.integer :question_id , :null => false
      t.integer :answer_choice_id, :null => false
      t.timestamps
    end
  end
end
