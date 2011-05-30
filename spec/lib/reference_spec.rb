require 'spec_helper'

describe 'Reference model' do

  before(:each) do
    @reference = Refinery::ReferenceLink::Reference.new(:model => 'Page', :title => 'Homepage', :text => 'Index')
    @reference_without_text = Refinery::ReferenceLink::Reference.new(:model => 'Page', :title => 'Homepage')
  end


  it 'should return original expression' do
    @reference.original.should == '[[Page/Homepage|Index]]'
    @reference_without_text.original.should == '[[Page/Homepage]]'
  end
  
  it 'should recognize exsiting reference' do
    Page.create!(:title => 'Homepage')
    @reference.exists?.should be true
  end
  
  it 'should recognize non-exsiting reference' do
    Page.create!(:title => 'Cool page')
    @reference.exists?.should be false
  end
  
  it 'should raise error when model is not referenceable' do
    Refinery::ReferenceLink::Reference.new(:model => 'NonreferenceableModel',
                                           :title => 'Homepage',
                                           :text => 'Index').should raise_error StandardError                   
  end
  
  it 'should retrun valid url if reference exsists' do
    Page.create!(:title => 'Homepage')
    @reference.link.should == {:action=>"show", :controller=>"/pages", :path=>["homepage"], :id=>nil}
  end
  
  it 'should retrun valid url if reference exsists' do
    @reference.link.should == nil
  end  
  
end
