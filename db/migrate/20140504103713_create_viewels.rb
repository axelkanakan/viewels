class CreateViewels < ActiveRecord::Migration
  def change
    create_table :viewels do |t|

      t.timestamps
    end
  end
end
