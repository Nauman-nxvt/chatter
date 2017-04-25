class Message < ApplicationRecord
  validates :message, :author, :dialect, presence: :true
end
