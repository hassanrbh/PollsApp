class AddIndexForPolls < ActiveRecord::Migration[7.0]
  def change
    add_index :polls, :author_id
    add_index :polls, :title
  end
end
