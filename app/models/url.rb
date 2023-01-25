class Url < ApplicationRecord
  before_create :set_key

  has_many  :clicks

  validates :address, url: true

  private

  def set_key
    self.key = SecureRandom.urlsafe_base64(4)
  end
end
