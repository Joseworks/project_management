# frozen_string_literal: true

class Role < ApplicationRecord
  has_many :users, dependent: nil

  validates :name, presence: true, allow_blank: false
end
