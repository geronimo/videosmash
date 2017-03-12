class VideoView
  include Mongoid::Document
  include Mongoid::Timestamps

  field :title, type: String
  field :genre, type: String

  belongs_to :video
  embedded_in :user
end
