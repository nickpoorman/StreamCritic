class Video
  include Mongoid::Document
  include Mongoid::Timestamps

  field :url

  # new columns need to be added here to be writable through mass assignment
  attr_accessible :url


  validates_presence_of :url
  validates_uniqueness_of :url, :allow_blank => true
  #validates_format_of :url :with => /^[-\w\._@]+$/i, :allow_blank => true, :message => "not a valid url"
  validates_length_of :url, :maximum => 2000, :allow_blank => true, :message => "url cannot exceed 2000"
end
