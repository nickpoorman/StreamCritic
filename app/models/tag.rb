class Tag
  include Mongoid::Document
  include Mongoid::Timestamps

  field :comment
  field :time

  validates_presence_of :comment, :time

  embedded_in :video, :inverse_of => :tags
end
