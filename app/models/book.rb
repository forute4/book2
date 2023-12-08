class Book < ApplicationRecord
  
  has_one_attached :book
  
  belongs_to :user
  
   def get_book
    unless book.attached?
      file_path = Rails.root.join('app/assets/books/no_image.jpg')
      book.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    book
   end
  
end
