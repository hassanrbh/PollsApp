class CreateQuestions < ActiveRecord::Migration[7.0]
  def change
    create_table :questions do |t|
      t.integer :poll_id , :null => false
      t.string :text ,:null => false
      t.timestamps
    end
  end
end
