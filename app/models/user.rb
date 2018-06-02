class User < ApplicationRecord
  before_save { email.downcase! }
  validates :name, presence: { message: 'Please fill in your name'}, 
                   length: { in: 3..50,
                             message: 'Number of characters must be between 3 and 50' }
  validates :email, presence: { message: 'Please fill in your email address'}, 
                    length: { in: 3..255,
                              message: 'Number of characters must be between 3 and 255' }, 
                    format: { with: /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i,
                              message: 'Invalid email address format' }
                    uniqueness: { case_sensitive: false,
                                  message: 'Email address already exists' }
  has_secure_password
  validatess :password, presence: { message: 'Pick a password' }, 
                        length: { in: 6..12,
                                  message: 'Number of characters must be between 6 and 12' }
                        format: { with: /\A[A-Za-z0-9_-\.]+\Z/,
                                  'Password should include alphanumeric characters,., - and _' }
end
