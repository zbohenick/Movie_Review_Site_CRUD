class Review < ApplicationRecord
    belongs_to :movie
    validates_presence_of :review, :headline, :body
end
