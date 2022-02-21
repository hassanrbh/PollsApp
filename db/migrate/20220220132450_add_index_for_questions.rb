class AddIndexForQuestions < ActiveRecord::Migration[7.0]
  def change
    add_index :questions, :poll_id
    add_index :questions, :text
  end
end
