class AddTypeToBadges < ActiveRecord::Migration[6.0]
  def change
    add_column :badges, :type, :string
    add_column :badges, :content, :string
  end
end
