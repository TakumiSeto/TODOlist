require 'trello'
require 'pry'
require 'trello'

def puts_todos
	configure
	cards = get_cards
 
 puts '----------------'
 puts '[TODOリスト]'
  cards.each do |card|
 	puts card.name
 end
 puts '----------------'
end


def configure
 Trello.configure do |config|
  config.developer_public_key = 'Trelloから発行された開発者向けAPIキー' 
  config.member_token = 'Trelloアカウントへのアクセス用トークン' 
 end
end


def get_cards
	member = Trello::Member.find('user91799134')
  boards = member.boards
  board = boards.find{ |board| board.name == 'TODO' }
  list = board.lists
  list = board.lists[0]
  cards = list.cards
  cards
end

puts_todos


