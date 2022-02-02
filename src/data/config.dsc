chat_config:
  type: data
  channels:
    global:
      targets: <server.online_players>
      color: <white>
      description: all players
    kingdom:
      targets: <server.online_players>
      color: <aqua>
      description: players in your kingdom
    near:
      targets: <player.location.find_players_within[50]>
      color: <light_purple>
      description: players in a 50-block radius

chat_prefix:
  type: procedure
  debug: false
  script:
  # Placeholder for when kingdoms are implemented
  - define kingdom <dark_gray>[<gray>Kingdom<dark_gray>]
  - define rank <player.flag[rank].proc[rank_get]>
  - define color <[rank].get[color].parsed>
  # Display rank info when hovering over the player's name - color is distinguishable by itself
  - define name <[color]><player.name.on_hover[<[color]><[rank].get[name]>]>
  - determine "<[kingdom]> <[name]><gray>:"

chat_join:
  type: procedure
  debug: false
  script:
  - determine "<gray>(<green>+<gray>) <player.name>"

chat_leave:
  type: procedure
  debug: false
  script:
  - determine "<gray>(<red>-<gray>) <player.name>"