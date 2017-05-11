class CreateMessages < ActiveRecord::Migration[5.0]
  def change
    create_table :messages do |t|
      t.string :name
      t.string :company
      t.string :tel_num
      t.string :email
      t.integer :msg_type_id
      t.text :content
      t.boolean :read_flag, default: false

      t.timestamps
    end
  end
end
