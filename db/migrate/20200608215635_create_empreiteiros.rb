class CreateEmpreiteiros < ActiveRecord::Migration[5.2]
  def change
    create_table :empreiteiros do |t|
      t.string :nome
      t.string :email
      t.string :telefone
      t.string :telemovel

      t.timestamps
    end
  end
end
