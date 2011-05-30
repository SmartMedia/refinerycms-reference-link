require 'spec_helper'

describe 'Referencer library' do

  def text
    @text ||= IO.read(File.expand_path("../../texts/test.txt", __FILE__))
  end

  it 'should be initialized' do
    Refinery::ReferenceLink::Referencer.should be_a_instance_of Class
  end
  
  it 'should has default syntax regexp' do
    Refinery::ReferenceLink::Referencer.syntax.should == /\[\[([^\[\]]+)\/([^\\|[\]]+)\|?([^\[\]]+)?\]\]/
  end
  
  it 'should return references from text with references' do
    references = Refinery::ReferenceLink::Referencer.parse(text)
    
    references.should be_a_instance_of Array
    references.first.should be_a_instance_of Refinery::ReferenceLink::Reference
  end
  
  it 'should return blank array when there are no references in text' do
    references = Refinery::ReferenceLink::Referencer.parse('bla bla bla bla')
    
    references.should be_a_instance_of Array
    references.should == []
  end
  
end
