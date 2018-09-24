class AddCameraAndCategoryToImages < ActiveRecord::Migration[5.2]
  def change
    add_reference :images, :camera, foreign_key: true
    add_reference :images, :category, foreign_key: true
  end
end
