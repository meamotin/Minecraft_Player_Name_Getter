#> get_player_name:
# @private

#> Get Player Name

## プレイヤーヘッドを召喚
  execute as @s run loot spawn ~ ~ ~ loot get_player_name:get_player_head

## Name情報を抜き取る
  data modify storage player_name: this set from entity @e[type=item,sort=nearest,limit=1,nbt={Item:{tag:{PlayerName:1b}}}] Item.tag.SkullOwner.Name

## プレイヤーヘッド消す
  kill @e[type=item,sort=nearest,limit=1,nbt={Item:{tag:{PlayerName:1b}}}]

## 再度プレイヤーヘッドを召喚
  execute as @s run loot spawn ~ ~ ~ loot get_player_name:get_player_name

## アイテム名を入手
  data modify storage player_name: this set from entity @e[type=item,sort=nearest,limit=1,nbt={Item:{tag:{PlayerName:1b}}}] Item.tag.display.Name

## プレイヤーヘッド消す
  kill @e[type=item,sort=nearest,limit=1,nbt={Item:{tag:{PlayerName:1b}}}]

## 通知
  tellraw @s [{"text": "PlayerName取得完了 ","color": "dark_gray"},{"text":"[ ","color": "aqua"},{"nbt":"this","storage": "player_name:","color": "green","interpret": true},{"text": " ]","color": "aqua"},{"text": " Storage -> player_name: this","color": "dark_gray"}]