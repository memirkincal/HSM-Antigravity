class Patient < ApplicationRecord
  has_many :appointments, dependent: :destroy

  validates :name, presence: true
  validates :identity_number, presence: true, uniqueness: true
end
