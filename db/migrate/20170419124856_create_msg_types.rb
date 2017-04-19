class CreateMsgTypes < ActiveRecord::Migration[5.0]
  def change
    create_table :msg_types do |t|
      t.string :name

      t.timestamps
    end
  end
end
