class Url < ApplicationRecord
  after_initialize :set_key

  has_many  :clicks

  validates_presence_of :address

  private

  def set_key
    self.key = SecureRandom.urlsafe_base64(4)
  end
end
