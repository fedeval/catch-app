class CreateIceBreakers < ActiveRecord::Migration[6.0]
  def change
    create_table :ice_breakers do |t|
      t.string :category
      t.text :content

      t.timestamps
    end
  end
end
