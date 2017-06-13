require 'nokogiri'
require 'json'
require 'pry'

def create_heroes_xml_from_file
  heroes_equipment = { "Batman" => ["Batrang",
                                    "Grapling Hook",
                                    "Batmobile",
                                    "Utility belt"],
                       "Green Lantern" => ["Ring of Will",
                                           "Lantern"]}

  file = File.read('input.json')
  heroes_data = JSON.parse(file)
  builder = build_xml(heroes_data, heroes_equipment)
  File.open("output.xml", "w") { |f| f.write(builder.to_xml) }
end

def build_xml(heroes_data, heroes_equipment)
  Nokogiri::XML::Builder.new do |xml|
    xml.data {
      build_xml_heroes(xml, heroes_data, heroes_equipment)
    }
  end
end

def build_xml_heroes(xml, heroes_data, heroes_equipment)
  heroes_data.each do |hero|
    xml.hero {
      build_xml_hero(xml, hero, heroes_equipment)
    }
  end
end

def build_xml_hero(xml, hero, heroes_equipment)
  xml.first_name hero["first_name"]
  xml.last_name hero["last_name"]
  xml.nickname hero["nickname"]
  xml.equipment {
    add_equipment(xml, hero, heroes_equipment)
  }
end

def add_equipment(xml, hero, heroes_equipment)
  heroes_equipment[hero["nickname"]].each{ |item| xml.item item }
end

create_heroes_xml_from_file
