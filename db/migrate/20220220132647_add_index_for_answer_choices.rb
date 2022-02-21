class AddIndexForAnswerChoices < ActiveRecord::Migration[7.0]
  def change
    add_index :answer_choices, :question_id
    add_index :answer_choices, :text
  end
end
