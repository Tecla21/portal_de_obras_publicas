class AddCellphoneToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :cellphone, :string
  end
end
