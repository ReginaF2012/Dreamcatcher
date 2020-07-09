class ChangePublicColumnName < ActiveRecord::Migration[6.0]
  def change
    rename_column :dreams, :public, :is_public
  end
end
