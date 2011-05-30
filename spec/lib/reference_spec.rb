require 'spec_helper'

describe 'Reference model' do

  before(:each) do
    @reference = Refinery::ReferenceLink::Reference.new(:model => 'Page', :title => 'Homepage', :text => 'Index')
  end


  it 'should return original expression' do
    @reference.original.should == '[[Page/Homepage|Index]]'
  end
  
  
end
