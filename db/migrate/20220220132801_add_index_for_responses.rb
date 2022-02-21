class AddIndexForResponses < ActiveRecord::Migration[7.0]
  def change
    add_index :responses, :question_id
    add_index :responses, :answer_choice_id
  end
end
