# name: musicbotrb
# about: My music bot for discord, written in the Ruby programming language
# version: 0.1
# authors: CRy386i
# github url: https://github.com/CRy386i/musicbotrb


# frozen_string_literal: true

require 'discordrb'
#require 'streamio-ffmpeg'


bot = Discordrb::Commands::CommandBot.new(token: '', client_id: , prefix: '!')

bot.command(:user, description: "Why me?",) do |us|
  us.send_message "#{us.user.name}"
end

bot.message(with_text: "test") do |ts|
  ts.respond "#{event.user.name}"
end

bot.command(:region, chain_usable: false, description: "Gets the region the server is stationed in.") do |rg|
  rg.server.region
end

bot.command(:connect) do |cn|
  channel = cn.user.voice_channel
  next "You're not in any voice channel!" unless channel
  bot.voice_connect(channel)
  "Connected to voice channel: #{channel_name}"
end

bot.command(:play_mp3) do |mp|
  voice_bot = mp.voice
  voice_bot.play_file('1.opus')
end

bot.command(:play_url) do |url_test|
  voice_bot = url_test.voice.play_io(open('https://youtu.be/2zczriUBRA0'))
#  voice_bot.play_file('1.mp3')
end


at_exit { bot.stop }
bot.run(true)

#bot.send_message(, "")
bot.join
