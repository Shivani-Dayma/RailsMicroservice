class UserFile < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  def file_url
    base_url = "http://127.0.0.1:3000"  
    ActiveStorage::Current.set(host: base_url) do
      self.file.url
    end
  end
  
end
