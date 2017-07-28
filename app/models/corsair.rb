class Corsair < ApplicationRecord
  before_save {self.first_name = first_name.downcase}
  validates :first_name, presence: true, length: {maximum: 20}
  validates :slack_handle, format: { without: /\s/ }
  validates :github_handle, format: { without: /\s/ }
  validates :age, numericality: { greater_than: 14, less_than: 100}
end
