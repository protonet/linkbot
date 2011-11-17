class Ping < Linkbot::Plugin
  Linkbot::Plugin.register('ping', self,
    {
      :message => {:regex => Regexp.new('ping', 'g'), :handler => :on_message}
    }
  )
  
  def self.on_message(message, matches)
    "pong"
  end
end
