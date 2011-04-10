class Tag
  include Mongoid::Document
  include Mongoid::Timestamps

  field :comment
  field :time_min
  field :time_sec

  attr_accessible :url
  before_validation :set_time_if_blank

  validates_presence_of :comment, :time

  embedded_in :video, :inverse_of => :tags

  private
    def set_time_if_blank
      self.time = '00:00'
    end
end
