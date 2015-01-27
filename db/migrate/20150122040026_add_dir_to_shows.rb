class AddDirToShows < ActiveRecord::Migration
  def change
    add_column :shows, :dir, :string
  end
end
