class Hello < Linkbot::Plugin
    def self.on_message(message, matches)
      helloes = [  "Hello to you too sir!",
          "What is up fool?",
          "Was?",
          "Guten Tag!",
          "Alter! Ich arbeite! :/",
          ""
            ]
      helloes[rand(helloes.length)]
    end

    Linkbot::Plugin.register('hello', self,
      {
        :message => {:regex => /h(e|a)llo @#{::BOT_USER}/, :handler => :on_message}
      }
    )
end
