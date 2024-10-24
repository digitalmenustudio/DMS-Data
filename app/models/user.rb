class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :rememberable, :validatable

  belongs_to :restaurant

  # Automatically assign the first restaurant before user creation
  before_validation :assign_first_restaurant

  searchable :email

  private

  def assign_first_restaurant
    # Find the first restaurant in the database (by ID or any other ordering criteria)
    self.restaurant ||= Restaurant.first
  end
end
