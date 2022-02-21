class EditResponses < ActiveRecord::Migration[7.0]
  def change
    add_column :responses, :user_id, :integer
    remove_column :responses, :question_id
  end
end
