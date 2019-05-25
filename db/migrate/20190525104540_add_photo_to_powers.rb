class AddPhotoToPowers < ActiveRecord::Migration[5.2]
  def change
    add_column :powers, :photo, :string
  end
end
