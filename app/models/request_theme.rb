class RequestTheme < ApplicationRecord
  validates :name, presence: true, length: {  maximum: 20 }
  validates :title, presence: true, length: { maximum: 100 }

end
