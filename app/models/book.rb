class Book < ApplicationRecord

  has_one_attached :book
  has_one_attached :image
  belongs_to :user
  validates :title, presence: true
  validates :body, length: { minimum: 1, maximum: 200 },presence: true
   def get_book
    unless book.attached?
      file_path = Rails.root.join('app/assets/books/no_image.jpg')
      book.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    book
   end

end
