class CreateLevel1Menus < ActiveRecord::Migration[5.0]
  def change
    create_table :level1_menus do |t|
      t.string :name
      t.string :en_name
      t.string :link
      t.datetime :deleted_at

      t.timestamps
    end
  end
end
