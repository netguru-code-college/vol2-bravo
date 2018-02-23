class CreateCooksOrganizations < ActiveRecord::Migration[5.1]
  def change
    create_table :cooks_organizations do |t|
      t.belongs_to :cook
      t.belongs_to :organization
      t.timestamps
    end
  end
end
