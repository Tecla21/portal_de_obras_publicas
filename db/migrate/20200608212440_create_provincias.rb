class CreateProvincias < ActiveRecord::Migration[5.2]
  def change
    create_table :provincias do |t|
      t.string :nome
      t.references :pais, foreign_key: true

      t.timestamps
    end
  end
end
