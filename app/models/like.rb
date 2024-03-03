class Like < ApplicationRecord
  belongs_to :horse
  belongs_to :user

  validates_uniqueness_of :horse_id, scope: :user_id
end
