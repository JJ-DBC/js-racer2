class CreatePlayers < ActiveRecord::Migration
  def change
    create_table :players do |t|
      t.string :name, index: true, unique: true

      t.timestamps
    end
  end
end
