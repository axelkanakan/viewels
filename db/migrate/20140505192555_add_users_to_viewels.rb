class AddUsersToViewels < ActiveRecord::Migration
  def change
    add_column :viewels, :user_id, :integer
    add_index :viewels, :user_id
  end
end
