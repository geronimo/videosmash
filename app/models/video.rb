class Video
  include Mongoid::Document
  field :title, type: String
  field :genre, type: String
  field :colour, type: String
end
