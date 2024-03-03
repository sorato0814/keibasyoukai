class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         has_many :horses, dependent: :destroy
         has_many :likes, dependent: :destroy
  has_many :liked_horses, through: :likes, source: :horse
  has_many :horses, dependent: :destroy
  validates :name, presence: true #追記
  validates :profile, length: { maximum: 200 } #追記
 
  has_many :comments, dependent: :destroy
  #mount_uploader :image, ImageUploader

  def already_liked?(horse)
    self.likes.exists?(horse_id: horse.id)
  end
end
