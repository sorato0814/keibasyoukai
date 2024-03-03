class HorseTagRelation < ApplicationRecord
  belongs_to :horse
  belongs_to :tag
end
