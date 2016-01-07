# War

class Card #I don't know? This was the easiest way for me to go about implenting the face cards.
    attr_accessor :value, :name
  
    def initialize(value, name)
        @value = value
        @name = name
    end
end

#deck = [1,1,1,1,2,2,2,2,3,3,3,3,4,4,4,4,5,5,5,5,6,6,6,6,7,7,7,7,8,8,8,8,9,9,9,9,10,10,10,10,11,11,11,11,12,12,12,12,13,13,13,13]

deck = [Card.new(14, "Ace"),
        Card.new(14, "Ace"),
        Card.new(14, "Ace"),
        Card.new(14, "Ace"),
        Card.new(2, 2),
        Card.new(2, 2),
        Card.new(2, 2),
        Card.new(2, 2),
        Card.new(3, 3),
        Card.new(3, 3),
        Card.new(3, 3),
        Card.new(3, 3),
        Card.new(4, 4),
        Card.new(4, 4),
        Card.new(4, 4),
        Card.new(4, 4),
        Card.new(5, 5),
        Card.new(5, 5),
        Card.new(5, 5),
        Card.new(5, 5),
        Card.new(6, 6),
        Card.new(6, 6),
        Card.new(6, 6),
        Card.new(6, 6),
        Card.new(7, 7),
        Card.new(7, 7),
        Card.new(7, 7),
        Card.new(7, 7),
        Card.new(8, 8),
        Card.new(8, 8),
        Card.new(8, 8),
        Card.new(8, 8),
        Card.new(9, 9),
        Card.new(9, 9),
        Card.new(9, 9),
        Card.new(9, 9),
        Card.new(10, 10),
        Card.new(10, 10),
        Card.new(10, 10),
        Card.new(10, 10),
        Card.new(11, "Jack"),
        Card.new(11, "Jack"),
        Card.new(11, "Jack"),
        Card.new(11, "Jack"),
        Card.new(12, "Queen"),
        Card.new(12, "Queen"),
        Card.new(12, "Queen"),
        Card.new(12, "Queen"),
        Card.new(13, "King"),
        Card.new(13, "King"),
        Card.new(13, "King"),
        Card.new(13, "King")]

shuffled_cards = deck.shuffle # shuffles deck
playerA = []
playerB = []
turn = 1

def war array1, array2, card
    
    puts "THIS MEANS WAR!!!!!!!!!!!!!!!!!!!"

    card = card + 1
    
    if (array1.length - card) <= 4 # check to see if there's enough cards left for war
        puts "Player B WINS THE GAME!"
        exit
    elsif (array2.length - card) <= 4
        puts "Player A WINS THE GAME!"
        exit
    end
    
    puts "Player A puts face down: #{array1[card].name}, #{array1[card+1].name}, #{array1[card+2].name}.  The face up card is: #{array1[card+3].name}"
    puts "Player B puts face down: #{array2[card].name}, #{array2[card+1].name}, #{array2[card+2].name}.  The face up card is: #{array2[card+3].name}"
    
    if array1[card+3].value > array2[card+3].value
        puts "Player A wins the war."
        array1.push(array1[card-1], array1[card], array1[card+1], array1[card+2], array1[card+3])
        array1.push(array2[card-1], array2[card], array2[card+1], array2[card+2], array2[card+3])
        (card+4).times do
            array1.delete_at(0)
            array2.delete_at(0)
        end
            
        return array1, array2
        
    elsif array1[card+3].value < array2[card+3].value
        puts "Player B wins the war."
        array2.push(array2[card-1], array2[card], array2[card+1], array2[card+2], array2[card+3])
        array2.push(array1[card-1], array1[card], array1[card+1], array1[card+2], array1[card+3])
        (card+4).times do
            array2.delete_at(0)
            array1.delete_at(0)
        end
        
        return array1, array2
        
    else
        return war array1, array2, card+4
    end
end

26.times do # Deal Cards
    playerA.push(shuffled_cards.pop)
    playerB.push(shuffled_cards.pop)
end

while (playerA.length > 0) && (playerB.length > 0)
    card = 0
    puts
    puts "Turn #{turn}:"
    puts "Player A: #{playerA[card].name}"
    puts "Player B: #{playerB[card].name}"
    
    if playerA[card].value > playerB[card].value
        puts "A wins that round."
        playerA.push(playerA[card])
        playerA.push(playerB[card])
        playerA.delete_at(card)
        playerB.delete_at(card)
    elsif playerA[card].value < playerB[card].value
        puts "B wins that round."
        playerB.push(playerB[card])
        playerB.push(playerA[card])
        playerB.delete_at(card)
        playerA.delete_at(card)
    else
        playerA, playerB = war playerA, playerB, card
    end
    
    turn = turn+1
    
    #p playerA # This is so I can watch what's happening
    #p playerB
    #puts playerA.length + playerB.length
end

if playerA.length == 0
    puts "PLAYER B is the WINNER!!!!!!!!!!!!!"
else
    puts "PLAYER A is the WINNER!!!!!!!!!!!!!"
end

