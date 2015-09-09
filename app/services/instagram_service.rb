# class InstagramService
#   attr_reader :connection
#
#   def initialize(access_token)
#     @connection ||= Hurley::Client.new("https://api.instagram.com/v1")
#     connection.query[:access_token] = access_token
#   end
#
#
#   def user_info(user_id)
#     parse(connection.get("users/#{user_id}"))
#   end
#
#   def user_feed
#     parse(connection.get("users/self/feed"))
#   end
#
#   def user_recent
#     parse(connection.get("users/self/media/recent"))
#   end
#
#   private
#
#   def parse(response)
#     JSON.parse(response.body)
#   end
# end