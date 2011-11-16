class Shutup < Linkbot::Plugin
    def self.on_message(message, matches)
      "No, YOU #{matches[0]}"
    end

    Linkbot::Plugin.register('shutup', self,
      {
        :message => {:regex => /(.*), @#{::BOT_USER}/, :handler => :on_message}
      }
    )
end
