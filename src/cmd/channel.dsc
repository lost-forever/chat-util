chat_channel:
  type: command
  name: channel
  description: Switches your current channel
  usage: /channel <&lt>name<&gt>
  aliases:
  - c
  - chat
  permission: chat.channel
  tab completions:
    1: <script[chat_config].data_key[channels].keys>
  script:
  - if <context.args.is_empty>:
    - foreach <script[chat_config].data_key[channels]> key:name as:data:
      - narrate "<yellow>/channel <[name]> <gray>to target <[data].get[description]>."
    - stop

  - if <context.args.first> not in <script[chat_config].data_key[channels].keys>:
    - define reason "That channel doesn't exist!"
    - inject cmd_err

  - define channel <context.args.first.to_lowercase>
  - flag <player> chat.meta:<[channel].equals[meta].if_true[true].if_false[!]>
  - flag <player> chat.channel:<[channel]>

  - narrate "<green>Now chatting in <yellow><context.args.first.to_lowercase><green>."