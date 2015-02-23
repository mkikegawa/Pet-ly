class CreatePets < ActiveRecord::Migration
  def change
    create_table :pets do |t|
      t.string  :name
      t.string  :summary
      t.string  :species
      t.string  :breed
      t.string  :sex
      t.string  :age
      t.string  :color
      t.string  :description

      t.timestamps null: false
    end
  end
end
