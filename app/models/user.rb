class User < ApplicationRecord
  attr_accessor :remember_token

  has_many :todos

  before_save { email.downcase! }
  validates :name, presence: { message: 'Please fill in your name'},
                   length: { in: 3..50,
                             message: 'Number of characters must be between 3 and 50' },
                    format: { with: /\A\w+( \w+)*\Z/,
                    message: 'Name should include alphabets only, separated by a single tab space' }
  validates :email, presence: { message: 'Please fill in your email address'},
                    length: { in: 3..255,
                              message: 'Number of characters must be between 3 and 255' },
                    format: { with: /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i,
                              message: 'Invalid email address format' },
                    uniqueness: { case_sensitive: false,
                                  message: 'Email address already exists' }
  has_secure_password
  validates :password, length: { in: 6..12,
                                  message: 'Number of characters must be between 6 and 12' },
                        allow_nil: true,
                        format: { with: /\A[-_\.A-Za-z0-9]+\z/,
                                  message: 'Password should include alphanumeric characters, full-stop, hyphen and underscore' }
  def User.new_token
    SecureRandom.urlsafe_base64
  end

  def remember
    self.remember_token = User.new_token
    update_attribute(:remember_digest, User.digest(remember_token))
  end
end
