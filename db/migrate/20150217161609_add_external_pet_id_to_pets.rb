class AddExternalPetIdToPets < ActiveRecord::Migration
  def change
    add_column :pets, :external_pet_id, :integer
  end
end
