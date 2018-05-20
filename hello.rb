require 'discordrb'
require 'rubicure'
require 'csv'
require 'dotenv'

Dotenv.load

bot = Discordrb::Commands::CommandBot.new(
  token: ENV['DISCORD_BOT_TOKEN'],
  client_id: ENV['DISCORD_BOT_CLIENT_ID'],
  prefix: '/'
)

dajare = CSV.read('./dajare.tsv', col_sep: "\t", headers: false)

bot.command :purecure do |event|
 event.send_message("こんにちは、 #{event.user.name}. プリキュアに返信するね")
 event.send_message(Precure.all.sample[:transform_message])
end

bot.command :dajare do |event|
 event.send_message("こんにちは、 #{event.user.name}. だじゃれ言うね")
 event.send_message(dajare.sample[1])
end


bot.run
