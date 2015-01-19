class CreateEpisodes < ActiveRecord::Migration
  def change
    create_table :episodes do |t|
      t.text :name
      t.references :show, index: true
      t.text :status
      t.text :dir
      t.text :grp

      t.timestamps null: false
    end
    add_index :episodes, [:show_id, :created_at]
  end
end
