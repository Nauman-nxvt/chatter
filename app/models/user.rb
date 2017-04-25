class User < ApplicationRecord
  validates :username, presence: :true, uniqueness: true
  validates :dialect, presence: :true
  enum dialect: [:yoda, :valley_girl, :binary]
end
