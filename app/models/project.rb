class Project < ActiveRecord::Base
  has_and_belongs_to_many :services
  accepts_nested_attributes_for :services, allow_destroy: true

  # validates
  validates :title, presence: true
  validates :title, uniqueness: true
  validates :image_url, allow_blank: true, format: {
    with: %r{\.(gif|jpg|png)\Z}i,
    message: " должен указывать на логотип формата PNG, JPG или GIF."
  }
end
