class CreateMessages < ActiveRecord::Migration[5.0]
  def change
    create_table :messages do |t|
      t.string :name
      t.string :company
      t.string :tel_num
      t.string :email
      t.integer :msg_type_id
      t.text :content
      t.string :read_flag, default: '0'
      #t.boolean, :read_flag, default: '0'

      t.timestamps
    end
  end
end
