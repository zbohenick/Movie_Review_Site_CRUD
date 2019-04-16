class Movie < ApplicationRecord
    mount_uploader :picture, PictureUploader
    has_many :reviews
    validates_presence_of :title, :description
end
