class AddPicsToPets < ActiveRecord::Migration
  def change
    add_column :pets, :pic1, :string
    add_column :pets, :pictmn1, :string
    add_column :pets, :pic2, :string
    add_column :pets, :pictmn2, :string
    add_column :pets, :pic3, :string
    add_column :pets, :pictmn3, :string
    add_column :pets, :pic4, :string
    add_column :pets, :pictmn4, :string
    add_column :pets, :video1, :string
  end
end
