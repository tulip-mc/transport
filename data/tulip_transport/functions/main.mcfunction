# tulip main loop


# transport
execute as @e[tag=gateway.generic] at @s run particle minecraft:reverse_portal ~ ~ ~ 0.6 0.6 0.6 0.2 1
## player inside?
execute as @e[tag=gateway.generic,tag=!gateway.to_transport_player] at @s as @a[distance=..2,limit=1,tag=!gateway.player_on_cooldown] run tag @s add gateway.player_to_transport
execute as @e[tag=gateway.generic,tag=!gateway.to_transport_player] at @s if entity @a[distance=..2,limit=1,tag=!gateway.player_on_cooldown] run tag @s add gateway.to_transport_player

execute as @e[tag=gateway.to_transport_player] at @s run function tulip_transport:system/transport/go

# teleport transporter
execute as @e[tag=gateway.transporter] at @s run tp ^ ^ ^0.5
execute as @e[tag=gateway.transporter] at @s run particle minecraft:flame ~ ~ ~ 0 0 0 0.05 1


## location 1
execute as @e[tag=gateway.transporter.type_1,scores={tulip_transport.gateway.location=1}] at @s if entity @e[tag=gateway.type_2,scores={tulip_transport.gateway.location=1},distance=..1.2] run function tulip_transport:system/transport/finish
# -
execute as @e[tag=gateway.transporter.type_2,scores={tulip_transport.gateway.location=1}] at @s if entity @e[tag=gateway.type_1,scores={tulip_transport.gateway.location=1},distance=..1.2] run function tulip_transport:system/transport/finish


# player cooldown timer
execute as @a[tag=gateway.player_on_cooldown_timer] at @s run function tulip_transport:system/cooldown/main
# transporter scheduled to kill
execute as @e[tag=gateway.transporter_to_kill] at @s run function tulip_transport:system/transport/to_kill/main