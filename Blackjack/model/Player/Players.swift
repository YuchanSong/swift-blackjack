//
//  Players.swift
//  Blackjack
//
//  Created by ycsong on 2022/05/24.
//

struct Players {
    private var values: [Player]
    
    init(_ players: [Player]) {
        self.values = players
    }
    
    func handoutAllPlayers(deck: Deck) throws {
        try values.forEach { (player) in
            let card = try deck.drawCard()
            player.deal(card)
        }
    }
    
    func askContinue(completion: (Bool, Player) throws -> ()) throws {
        for player in values where player.playing && player.keepDeal {
            let ask: Bool = try InputView.readDrawYesOrNo(name: player.name)
            try completion(ask, player)
        }
    }
    
    var resultDescription: String {
        values.map {
            $0.resultDescription
        }.joined(separator: "\n")
    }
}

extension Players: CustomDebugStringConvertible {
    var debugDescription: String {
        String(describing: values)
    }
}

extension Players {
    func customMap<T>(_ Element: (Player) -> T) -> [T] {
        var result: [T] = []
        
        values.forEach { (player) in
            result.append(Element(player))
        }
        
        return result
    }

    func customFilter(_ completion: ((_ item: Player) -> Bool)) -> [Player] {
        var res: [Player] = []
        
        values.forEach { (player) in
            if completion(player) {
                res.append(player)
            }
        }

        return res
    }
}
