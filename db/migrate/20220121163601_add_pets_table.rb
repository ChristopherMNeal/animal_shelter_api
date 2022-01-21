class AddPetsTable < ActiveRecord::Migration[5.2]
  def change
    create_table :pets do |t|
      t.column :name, :string
      t.column :species, :string

      t.timestamps()
  end
end
