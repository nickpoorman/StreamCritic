class Tag
  include Mongoid::Document
  include Mongoid::Timestamps

  field :comment
  field :time, type: BigDecimal

  #before_validation :set_time_if_blank

  validates_presence_of :comment

  embedded_in :video, :inverse_of => :tags

  private
end
