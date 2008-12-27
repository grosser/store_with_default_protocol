require File.expand_path("spec_helper", File.dirname(__FILE__))

describe :store_with_default_protocol do
  before do
    @user = User.new
  end
  it "add the default protocol to a column" do
    @user.website = 'xxx'
    @user.website.should == 'http://xxx'
  end
  it "works when multiple columns are specified" do
    @user.image_url = 'y'
    @user.image_url.should == 'http://y'
  end
  it "handles all kinds of query strings" do
    url = 'abc.com/adss?sds=1221&dss=xcxc'
    @user.website = url
    @user.website.should == "http://#{url}"
  end
  it "stores the protocol" do
    @user.website = 'x'
    @user.save!
    @user.reload.website.should == 'http://x'
  end
  it "stores the protocol when using update_attribute" do
    @user.save!
    @user.update_attribute(:website,'x')
    @user.website.should == 'http://x'
  end
  it "does not remove an existing protocol" do
    @user.website = 'ftp://x'
    @user.website.should == 'ftp://x'
  end
  it "does not add protocols for other columns" do
    @user.name = 'x'
    @user.name.should == 'x'
  end
  it "handles any protocol" do
    @user.git_url = 'x'
    @user.git_url.should == 'git://x'
  end
  it "works with an existing setter method" do
    @user.overwritten_url = 'x'
    @user.overwritten_url.should == 'http://x-1'
  end
  it "does not store protocol for nil values" do
    @user.website = nil
    @user.website.should == nil
  end
  it "does not store protocol for blank values" do
    @user.website = "  "
    @user.website.should == "  "
  end
end