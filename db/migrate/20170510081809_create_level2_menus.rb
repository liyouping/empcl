class CreateLevel2Menus < ActiveRecord::Migration[5.0]
  def change
    create_table :level2_menus do |t|
      t.integer :level1_menu_id
      t.string :name
      t.string :en_name
      t.string :link
      t.datetime :deleted_at

      t.timestamps
    end
  end
end
