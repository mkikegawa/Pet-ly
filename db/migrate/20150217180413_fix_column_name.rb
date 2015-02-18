class FixColumnName < ActiveRecord::Migration
  def change
    rename_column :pets, :external_pet_id, :animalID
  end
end
