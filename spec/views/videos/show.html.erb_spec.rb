require 'spec_helper'

describe "videos/show.html.erb" do
  before(:each) do
    @video = assign(:video, stub_model(Video,
      :url => "Url"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Url/)
  end
end
