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
    # sorry fro this fix
    "#{Refinery::ReferenceLink::Formatter.parse(text)}\n".should == parsed_text
  end

end
