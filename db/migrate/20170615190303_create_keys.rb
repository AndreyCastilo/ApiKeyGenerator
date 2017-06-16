class CreateKeys < ActiveRecord::Migration[5.0]
  def change
    create_table :keys do |t|
      t.string :correo
      t.string :api_key
      t.integer :cantidadReq

      t.timestamps
    end
    add_index :keys, :correo, unique: true
  end
end
