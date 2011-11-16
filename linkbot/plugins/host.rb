class Host < Linkbot::Plugin
    def self.on_message(message, matches)
      hosts = [ 
        "http://a3.twimg.com/profile_images/1374093799/Seda_bigger.jpg",
        "http://a3.muscache.com/users/919433/profile_pic/1312464745/square_225.jpg",
        "http://www.pollsb.com/photos/o/60156-ugly_girl.jpg",
        "http://c580019.r19.cf2.rackcdn.com/wp-content/uploads/2010/05/hasselhodff-hospitalized.jpg",
        "http://www.uniscene.de/images/articles/8fd6a11b7781e07ee903078f26204f76.jpg"
      ]
      {:image => hosts[rand(hosts.length)]}
    end

    Linkbot::Plugin.register('hosts', self,
      {
        :message => {:regex => /hor?st/, :handler => :on_message}
      }
    )
end
