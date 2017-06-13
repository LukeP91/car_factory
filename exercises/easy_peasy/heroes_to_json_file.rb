require 'json'
def heroes_to_json_file
  heroes_data = [{
                  first_name: 'Bruce',
                  last_name: 'Wayne',
                  nickname: 'Batman',
                  },
                  {
                  first_name: 'Hal',
                  last_name: 'Jordan',
                  nickname: 'Green Lantern',
                  }
                ]
  
  File.open("input.json", "w") { |f| f.write(JSON.pretty_generate(heroes_data)) }
end

heroes_to_json_file
