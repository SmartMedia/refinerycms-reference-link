require 'spec_helper'

describe 'Referencer library' do

  it 'should be initialized' do
    Refinery::ReferenceLink::Referencer.should be_a_instance_of Class
  end
  
end
