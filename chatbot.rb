$LOAD_PATH.unshift "#{File.dirname(__FILE__)}/../linkbot"

require 'rubygems'
require 'protolink'
require 'linkbot/base_plugins'

# require 'ruby-debug'
# Debugger.start

# change the config file if you need to connect to another server
config = JSON.parse(File.read("config.json"))

PTN_SERVER = config["server"]
BOT_USER   = config["user"]
BOT_PASS   = config["password"]

# from https://github.com/markolson/linkbot
Linkbot::Plugin.collect


protonet = Protolink::Protonet.open(PTN_SERVER, BOT_USER, BOT_PASS)
protonet.socket do |json|
  if json["trigger"] == "meep.receive" && json["user_id"] != protonet.current_user.id
    response = Linkbot::Plugin.handle_message(Message.new(json["message"], json["user_id"], json["author"], :message)) 
  end
  unless response.blank?
    c = protonet.find_channel(json["channel_id"])
    response = response.first
    if response.is_a?(Hash)
      image_url = (response[:image] || response[:images].first)
      text_extension = {
        "title"         =>  response[:title] || "bot",
        "titleAppendix" => "image",
        "url"           => image_url,
        "type"          => "Image",
        "image"         => image_url
      }
      c.speak(response[:message] || "", :text_extension => text_extension) if image_url
    else
      c.speak(response)
    end
  end
end
