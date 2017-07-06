require 'slack-ruby-bot'
require 'httparty'
require 'json'

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
    template_id = 61579
    username = ENV['IMGFLIP_USERNAME']
    password = ENV['IMGFLIP_PASSWORD']
    response = HTTParty.post("https://api.imgflip.com/caption_image",
                             body: {
                               template_id: template_id,
                               username: username,
                               password: password,
                               text0: "One does not simply",
                               text1: match[1],
                             })
    answer = JSON.parse(response.body)
    if answer['success']
      client.say(text: answer['url'], channel: data.channel)
    else
      client.say(text: "EEEERRRRRRORRRZ!!!!! #{answer['error_message']}", channel: data.channel)
    end
  end
end

Memer.run
