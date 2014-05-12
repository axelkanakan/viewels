class AddPrivateToViewels < ActiveRecord::Migration
  def change
    add_column :viewels, :private, :boolean, default: false
  end
end
