# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :timeoutable, :trackable, :lockable, :registerable and :omniauthable
  devise :database_authenticatable, :recoverable, :rememberable, :validatable

  has_many :projects, inverse_of: :creator, dependent: :destroy
  has_many :comments, inverse_of: :creator, dependent: :destroy
end
