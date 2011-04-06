require 'spec_helper'

describe "videos/index.html.erb" do
  before(:each) do
    assign(:videos, [
      stub_model(Video,
        :url => "Url"
      ),
      stub_model(Video,
        :url => "Url"
      )
    ])
  end

  it "renders a list of videos" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Url".to_s, :count => 2
  end
end
