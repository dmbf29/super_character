require 'open-uri'
require 'nokogiri'

namespace :character do
  desc "Try to steal the photo form the wiki"
  task find_photos: :environment do

    Character.find_each do |character|
      next if character.photo.present?

      url =  URI.encode("https://simpsons.fandom.com/wiki/#{character.name.gsub("\"", "'").gsub(" ", "_")}")
      begin
        html_doc = Nokogiri.HTML(open(url).read)
        if html_doc
          photo_div = html_doc.search('.pi-item')[1]
          if photo_div
            photo_url = photo_div.search('img').first.attributes['src'].value
            if photo_url
              character.remote_photo_url = photo_url
              character.save
            end
            puts "Photo added for #{character.name}"
          else
            puts "Photo not found for #{character.name}"
          end
        else
          puts "HTML not found for #{character.name}"
        end
      rescue OpenURI::HTTPError => ex
        puts "#{character.name} has a 404 page"
      end
    end
  end
end
