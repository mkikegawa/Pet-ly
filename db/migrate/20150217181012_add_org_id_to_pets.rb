class AddOrgIdToPets < ActiveRecord::Migration
  def change
    add_column :pets, :orgID, :integer
  end
end
