class Article < ActiveRecord::Base
 validates :title, presence: true
 validates :description, presence: true, length: {minimum: 10, maximum: 300}
end

