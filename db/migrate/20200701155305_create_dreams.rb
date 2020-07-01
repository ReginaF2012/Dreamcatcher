class CreateDreams < ActiveRecord::Migration[6.0]
  def change
    create_table :dreams do |t|
      t.text :content
      t.string :title
      t.boolean :public
      t.string :dream_type
      t.belongs_to :user
      t.timestamps
    end
  end
end
