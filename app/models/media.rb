class Media < OpenStruct

  def self.recent_media
  end

  def self._build_object(data)
    OpenStruct.new(data)
  end

end

