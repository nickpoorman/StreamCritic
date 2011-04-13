class Tag
  include Mongoid::Document
  include Mongoid::Timestamps

  field :comment
  field :time, type: Float

  # CHANGED embedded_in :video, :inverse_of => :tags
  belongs_to :video
  belongs_to :user

  #before_validation :set_time_if_blank

  validates_presence_of :comment

end
