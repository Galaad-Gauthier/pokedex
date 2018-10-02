class Info < ApplicationRecord

  validates :tag, presence: true, uniqueness: true
  validates :body, presence: true

end
