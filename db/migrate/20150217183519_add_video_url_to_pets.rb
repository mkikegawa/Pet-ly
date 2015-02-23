class AddVideoUrlToPets < ActiveRecord::Migration
  def change
    add_column :pets, :videoUrl1, :string
  end
end
