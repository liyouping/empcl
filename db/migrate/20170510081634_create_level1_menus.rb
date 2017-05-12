class CreateLevel1Menus < ActiveRecord::Migration[5.0]
  def change
    create_table :level1_menus do |t|
      t.string :name
      t.string :en_name
      t.string :link
      t.integer :show_type,default: 0 #0中英文下都显示  1只在中文下显示  2只在英文下显示
      t.integer :position,default: 0
      t.datetime :deleted_at

      t.timestamps
    end
  end
end
