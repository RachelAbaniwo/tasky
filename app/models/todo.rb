class Todo < ApplicationRecord
  validates :title, presence: { message: 'Please fill todo title'}
  validates :description, presence: { message: 'Please fill todo description'}
  validates :completed, inclusion: { in: [true, false] }
  validates :user_id, presence: { message: 'Login to create a new todo.' }
end
