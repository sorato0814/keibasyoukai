class CreateHorseTagRelations < ActiveRecord::Migration[6.1]
  def change
    create_table :horse_tag_relations do |t|
      t.references :horse, null: false, foreign_key: true
      t.references :tag, null: false, foreign_key: true

      t.timestamps
    end
  end
end
