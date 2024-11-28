class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :validatable

  has_one :cart, dependent: :destroy

   # Validation pour les champs ajoutés
   validates :name, presence: true
  after_create :create_cart, :welcome_send

  def welcome_send
    UserMailer.welcome_email(self).deliver_now
  end

  private

  def create_cart
    Cart.create(user: self)
  end
end
