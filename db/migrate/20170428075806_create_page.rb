class CreatePage < ActiveRecord::Migration[5.0]
  def change
    create_table :pages do |t|
      t.string :title
      t.text :content
      t.datetime :deleted_at

      t.timestamps
    end
  end
end
