class Horse < ApplicationRecord

    mount_uploader :image, ImageUploader
    belongs_to :user
    has_many :likes, dependent: :destroy
    has_many :liked_users, through: :likes, source: :user
    has_many :comments, dependent: :destroy

#horsesテーブルから中間テーブルに対する関連付け
has_many :horse_tag_relations, dependent: :destroy
#horsesテーブルから中間テーブルを介してTagsテーブルへの関連付け
has_many :tags, through: :horse_tag_relations, dependent: :destroy

end

