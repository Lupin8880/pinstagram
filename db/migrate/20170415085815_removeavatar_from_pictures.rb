class RemoveavatarFromPictures < ActiveRecord::Migration
  def up
    remove_column :pictures, :avatar
      end

  def down
    add_column :pictures, :avatar, :binary
  end
end
