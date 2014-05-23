class AddTitleToViewels < ActiveRecord::Migration
  def change
    add_column :viewels, :title, :string
  end
end
