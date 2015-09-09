class Media < OpenStruct

  def self.service
    @service ||= InstagramService.new(ENV["instagram_id"])
  end

  # def self.all
  #   service.all_media.map { |media| Media.new(media)}
  # end
  #
  # def self.find(id)
  #   Media.new(service.media(id))
  # end



  def self._build_object(data)
    OpenStruct.new(data)
  end
end

