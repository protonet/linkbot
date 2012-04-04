require 'open-uri'
require 'uri'

class Cat < Linkbot::Plugin
  
  Linkbot::Plugin.register('cat', self,
    {
      :message => {:regex => /!cat/, :handler => :on_message, :help => :help}
    }
  )
  
  def self.on_message(message, matches)
    adjective = ["adorable","beautiful","clean","drab","elegant","fancy","glamorous","handsome","long","magnificent","old-fashioned","plain","quaint","sparkling","ugliest","unsightly","wide-eyed","red","orange","yellow","green","blue","purple","gray","black","white","alive","better","careful","clever","dead","easy","famous","gifted","helpful","important","inexpensive","mushy","odd","powerful","rich","shy","tender","uninterested","vast","wrong","angry","bewildered","clumsy","defeated","embarrassed","fierce","grumpy","helpless","itchy","jealous","lazy","mysterious","nervous","obnoxious","panicky","repulsive","scary","thoughtless","uptight","worried","agreeable","brave","calm","delightful","eager","faithful","gentle","happy","jolly","kind","lively","nice","obedient","proud","relieved","silly","thankful","victorious","witty","zealous","broad","chubby","crooked","curved","deep","flat","high","hollow","low","narrow","round","shallow","skinny","square","steep","straight","wide","big","colossal","fat","gigantic","great","huge","immense","large","little","mammoth","massive","miniature","petite","puny","scrawny","short","small","tall","teeny","teeny-tiny","tiny","cooing","deafening","faint","hissing","loud","melodic","noisy","purring","quiet","raspy","screeching","thundering","voiceless","whispering","ancient","brief","early","fast","late","long","modern","old","old-fashioned","quick","rapid","short","slow","swift","young","bitter","delicious","fresh","greasy","juicy","hot","icy","loose","melted","nutritious","prickly","rainy","rotten","salty","sticky","strong","sweet","tart","tasteless","uneven","weak","wet","wooden","yummy","boiling","breeze","broken","bumpy","chilly","cold","cool","creepy","crooked","cuddly","curly","damaged","damp","dirty","dry","dusty","filthy","flaky","fluffy","freezing","hot","warm","wet","abundant","empty","few","full","heavy","light","many","numerous","sparse","substantial"].choice
    
    doc = JSON.parse(open("http://ajax.googleapis.com/ajax/services/search/images?v=1.0&q=#{URI.encode(adjective + " cat")}&rsz=8&safe=off", "Referer" => "http://lgscout.com").read)
    if doc["responseData"]["results"].length > 0
      {:image => doc["responseData"]["results"][rand(doc["responseData"]["results"].length)]["url"], :title => "#{adjective} cat"}
    else
      "No #{adjective} cat found!"
    end
  end
  
  def self.help
    "!cat - Return a random cat picture"
  end
end

