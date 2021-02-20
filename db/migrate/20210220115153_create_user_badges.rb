class CreateUserBadges < ActiveRecord::Migration[6.0]
  def change
    create_table :user_badges do |t|
      t.references :badge, null: false, foreign_key: true
      t.bigint :sender_id
      t.bigint :receiver_id


      t.timestamps
    end
  end
end
