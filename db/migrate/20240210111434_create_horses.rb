class CreateHorses < ActiveRecord::Migration[6.1]
  def change
    create_table :horses do |t|
      t.string :name
      t.integer :uma_id
      t.string :year
      t.string :image
      t.text :about_uma
      t.text :about_race
      t.string :sex

      t.timestamps
    end
  end
end
