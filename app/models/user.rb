class User < ApplicationRecord
  def self.koala(auth)
  	access_token = auth['token']
  	facebook = Koala::Facebook::API.new(access_token)
  	pages = facebook.get_connections('me','accounts')
  	first_page_token = pages.first['access_token']
  	page_graph = Koala::Facebook::API.new(first_page_token)
  	photo_ids = page_graph.get_connection('me','albums').map{|hash| hash['id']}
    photo_ids.map {|id| facebook.get_picture(id)}

  end
end
