class AddUserIdToHorses < ActiveRecord::Migration[6.1]
  def change
    add_column :horses, :user_id, :integer
  end
end
