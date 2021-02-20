class RenameTypeColumnInBadges < ActiveRecord::Migration[6.0]
  def change
    rename_column :badges, :type, :category
  end
end
