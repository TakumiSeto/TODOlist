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
  config.developer_public_key = 'd4a951d50eb672ceece4e4c28144c13a' # The "key" from step 1
  config.member_token = '47137879beeab745b970a0d21067bf4b78236049e0c85a61c961fd47fbf95623' # The token from step 2.
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


