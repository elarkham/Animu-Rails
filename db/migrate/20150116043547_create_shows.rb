class CreateShows < ActiveRecord::Migration
  def change
    create_table :shows do |t|
      t.text :name
      t.text :status

      t.timestamps null: false
    end
  end
end
