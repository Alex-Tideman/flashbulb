class InstagramService
  attr_reader :connection

  def initialize(instagram_id)
    @connection = Hurley::Client.new("https://api.instagram/v1/media/?client_id=#{instagram_id}")
  end

  # def all_media
  #   parse(connection.get("media"))
  # end

  # def media(id)
  #   parse(connection.get("media/#{id}"))
  # end

  private

  def parse(response)
    require 'pry';binding.pry
    JSON.parse(response.body)
  end
end