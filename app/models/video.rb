class Video
  include Mongoid::Document
  field :title, type: String
  field :genre, type: String
  # has_many :genre
end
