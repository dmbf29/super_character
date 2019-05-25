class CreateCharacterPowers < ActiveRecord::Migration[5.2]
  def change
    create_table :character_powers do |t|
      t.references :power, foreign_key: true
      t.references :character, foreign_key: true

      t.timestamps
    end
  end
end
