class User < ApplicationRecord
  has_secure_password

  has_many :posts

  def view_path
    type.downcase.pluralize
  end
end
