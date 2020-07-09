class CreateDreamSymbolisms < ActiveRecord::Migration[6.0]
  def change
    create_table :dream_symbolisms do |t|
      t.belongs_to :dream, foreign_key: true
      t.belongs_to :symbolism, null: false, foreign_key: true
      t.text :meaning

      t.timestamps
    end
  end
end
