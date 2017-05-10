class CreateLevel3Menus < ActiveRecord::Migration[5.0]
  def change
    create_table :level3_menus do |t|
      t.integer :level1_menu_id
      t.integer :level2_menu_id
      t.string :name
      t.string :en_name
      t.string :link
      t.datetime :deleted_at

      t.timestamps
    end
  end
end
