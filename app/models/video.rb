class Video
  include Mongoid::Document
  include Mongoid::Timestamps

  field :url
  field :vid

  #CHANGED embeds_many :tags
  has_many :tags

  # new columns need to be added here to be writable through mass assignment
  attr_accessible :url, :vid
  before_validation :prepare_vid

  validates_presence_of :url
  validates_format_of :url, :with => /.*youtube.com.*\?v=.*/i, :allow_blank => true, :message => " is not valid. Please input a youtube video url."
  validates_length_of :url, :maximum => 2000, :allow_blank => true, :message => "url cannot exceed 2000"
  validates_uniqueness_of :url, :allow_blank => true
  validates_uniqueness_of :vid, :allow_blank => true



  private

    #we are going to need error checking here
    def prepare_vid
      unless url.blank?
        uri = URI::parse(url)
        if uri.query
          uri_params = CGI::parse(uri.query)
          tubeid = uri_params['v']
          if !tubeid.blank?
            self.vid = tubeid[0]
            return;
          end
        end
      end
      self.vid = nil
    end

end
