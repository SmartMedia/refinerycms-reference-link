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
  
  
end
