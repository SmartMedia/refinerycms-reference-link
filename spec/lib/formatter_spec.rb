require 'spec_helper'

describe 'Formatter library' do

  def text
    @text ||= IO.read(File.expand_path("../../texts/test.txt", __FILE__))
  end
  
  def parsed_text
    @parsed_text ||= IO.read(File.expand_path("../../texts/parsed_test.txt", __FILE__))     
  end

  it 'should translate reference expression into html hyperlink' do
    Page.create!(:title => 'Homepage')  
    Refinery::ReferenceLink::Formatter.parse(text).should == parsed_text
  end

end
