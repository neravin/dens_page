class Project < ActiveRecord::Base
  validates :title, presence: true
  validates :title, uniqueness: true
  validates :image_url, allow_blank: true, format: {
    with: %r{\.(gif|jpg|png)\Z}i,
    message: " должен указывать на логотип формата PNG, JPG или GIF."
  }
end
