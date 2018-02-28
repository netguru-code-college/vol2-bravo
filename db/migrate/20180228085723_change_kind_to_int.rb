class ChangeKindToInt < ActiveRecord::Migration[5.1]
  def change
    change_column :ingredients, :kind, 'integer USING CAST(kind AS integer)'
  end
end
