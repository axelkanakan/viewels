class AddAvatarToViewels < ActiveRecord::Migration
  def change
    add_column :viewels, :avatar, :string
  end
end
