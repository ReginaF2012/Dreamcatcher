class CreateSymbolisms < ActiveRecord::Migration[6.0]
  def change
    create_table :symbolisms do |t|
      t.string :name

      t.timestamps
    end
  end
end
