# encoding: UTF-8

class Mittag < Linkbot::Plugin
    def self.on_message(message, matches)
      case matches[0]
      when 'pauline'
        "here you go lazy bum: http://www.pauline-cafe.de/fileadmin/downloads/mittagskarte.pdf"
      when 'feldstern'
        {:image => "http://www.feldstern.net/feld_mittag.jpg", :message => "so lazy!"}
      when 'hanoi'
        "ok: http://www.hanoi-hh.de/menu/weeklyMenu1.pdf"
      when 'döner'
        {:image => 'http://www.seriouseats.com/images/20110214_D%C3%B6ner_Kebab.jpg'}
      end
    end

    Linkbot::Plugin.register('mittag', self,
      {
        :message => {:regex => /!mittag.*(pauline|feldstern|hanoi|döner)/i, :handler => :on_message}
      }
    )
end