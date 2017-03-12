class VideoView
  include Mongoid::Document
  include Mongoid::Timestamps

  belongs_to :video
  embedded_in :user
end
