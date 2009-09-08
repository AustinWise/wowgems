require 'rubygems'
require 'sinatra'
require 'xml'

get '/' do
  doc = XML::Document.file('Gems.xml')
  
  @jewelry = []
  doc.find('//gems/wrath/jewelry/item').each do |g|
    @jewelry << g.attributes.inject({}) { |h, a| h[a.name] = a.value; h }
  end
  
  @metaGems = []
  doc.find('//gems/wrath/meta/gem').each do |g|
    @metaGems << g.attributes.inject({}) { |h, a| h[a.name] = a.value; h }
  end
  
  @epicGems = []
  doc.find('//gems/wrath/epic/gem').each do |g|
    @epicGems << g.attributes.inject({}) { |h, a| h[a.name] = a.value; h }
  end
  
  @rareGems = []
  doc.find('//gems/wrath/rare/gem').each do |g|
    @rareGems << g.attributes.inject({}) { |h, a| h[a.name] = a.value; h }
  end
  
  erb :gems
end