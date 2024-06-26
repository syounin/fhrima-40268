class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true 
  
  validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i , message: 'には英字と数字の両方を含めて六文字以上で設定してください' }
  with_options presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: '全角文字を使用してください' } do
   validates :last_name
   validates :first_name
  end
  with_options presence: true, format: { with: /\A[ァ-ヶー]+\z/, message: 'カナ文字を使用してください' } do
   validates :last_name_kana
   validates :first_name_kana
  end
  validates :birth, presence: true

  has_many :items
end
