require 'rubygems'
require 'sinatra'
require 'xml'

get '/' do
  doc = XML::Document.file('Gems.xml')
  @epicGems = []
  doc.find('//gems/wrath/epic/gem').each do |g|
    @epicGems << g.attributes.inject({}) { |h, a| h[a.name] = a.value; h }
  end
  erb :gems
end

