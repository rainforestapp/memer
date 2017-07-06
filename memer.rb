require 'slack-ruby-bot'

class Memer < SlackRubyBot::Bot
  command 'ping' do |client, data, match|
    client.say(text: 'pong', channel: data.channel)
  end

  command 'what time is it?' do |client, data, match|
    client.say(text: Time.now, channel: data.channel)
  end

  command 'puppy-me' do |client, data, match|
    client.say(gif: 'puppy', channel: data.channel)
  end

  command 'cheer me up' do |client, data, match|
    client.say(gif: 'happy', channel:data.channel)
  end

  match /I'm going to (.+)/ do |client, data, match|
    client.say(text: "One does not simply #{match[1]}", channel: data.channel)
  end
end

Memer.run
