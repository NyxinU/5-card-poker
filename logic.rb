Our game logic approach to poker
---

Game:: play
   # at the emd
   5 cards to each player

   each player knows the value of their own cards

   # betting phase
   loop go through players   until everyone checked/called or folded
      players bet/call/fold
    end
   all remaining players
      player.sees(hand)
      player.selects_cards_to_discard(0..3)
      player.redraws_same_amount

   loop go through players   until everyone checked/called or folded
     hand.calculations
     if raised, then restart loop from that player

   best handcalculation wins


@currentplayers = [all players]
    if fold, currentplayer.delete(folded player)
