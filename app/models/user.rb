# frozen_string_literal: true

class User < ApplicationRecord
  require 'jwt'

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  EMAIL_RGX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :email, presence: true, format: { with: EMAIL_RGX }, uniqueness: { case_sensitive: false }, allow_blank: false
end
