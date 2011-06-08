require 'spec_helper'

describe 'Reference model' do

  before(:each) do
    @reference = Refinery::ReferenceLink::Reference.new(:title => 'Homepage', :text => 'Index', :html => '<a href="Homepage">Homepage</a>')
  end

  it 'should recognize exsiting reference' do
    Page.create!(:title => 'Homepage')
    @reference.exists?.should be true
  end
  
  it 'should recognize non-exsiting reference' do
    Page.create!(:title => 'Cool page')
    @reference.exists?.should be false
  end
  
  it 'should retrun valid url if reference exsists' do
    Page.create!(:title => 'Homepage')
    @reference.link.should == {:action=>"show", :controller=>"/pages", :path=>["homepage"], :id=>nil}
  end
  
  it 'should retrun valid url if reference exsists' do
    @reference.link.should == nil
  end  
  
end
