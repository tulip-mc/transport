# tulip main loop


# transport
execute as @e[tag=gateway.generic] at @s run particle minecraft:portal ~ ~ ~ 0.6 0.6 0.6 0.2 4
## player inside?
execute as @e[tag=gateway.generic,tag=!gateway.to_transport_player] at @s if entity @a[distance=..2.2,limit=1,tag=!gateway.player_on_cooldown] run function tulip_transport:system/transport/check

execute as @e[tag=gateway.to_transport_player] at @s run function tulip_transport:system/transport/go

# teleport transporter
execute as @a[tag=gateway.player_on_cooldown] at @s if entity @e[tag=gateway.transporter,distance=..3] if score @e[tag=gateway.transporter,distance=..3,limit=1] temp_store.uuid.0 = @s temp_store.uuid.0 if score @e[tag=gateway.transporter,distance=..3,limit=1] temp_store.uuid.1 = @s temp_store.uuid.1 if score @e[tag=gateway.transporter,distance=..3,limit=1] temp_store.uuid.2 = @s temp_store.uuid.2 if score @e[tag=gateway.transporter,distance=..3,limit=1] temp_store.uuid.3 = @s temp_store.uuid.3 run tp @s @e[tag=gateway.transporter,distance=..3,limit=1]

execute as @e[tag=gateway.transporter] at @s run tp ^ ^ ^0.85
execute as @e[tag=gateway.transporter] at @s run playsound minecraft:ambient.crimson_forest.mood player @a ~ ~ ~ 0.2
execute as @e[tag=gateway.transporter] at @s run particle minecraft:cloud ~ ~0.5 ~ 0 0.1 0 0 6


## location 1
execute as @e[tag=gateway.transporter.type_1,scores={tulip_transport.gateway.location=1}] at @s if entity @e[tag=gateway.type_2,scores={tulip_transport.gateway.location=1},distance=..1.2] run function tulip_transport:system/transport/finish
# -
execute as @e[tag=gateway.transporter.type_2,scores={tulip_transport.gateway.location=1}] at @s if entity @e[tag=gateway.type_1,scores={tulip_transport.gateway.location=1},distance=..1.2] run function tulip_transport:system/transport/finish


# player cooldown timer
execute as @a[tag=gateway.player_on_cooldown_timer] at @s run function tulip_transport:system/cooldown/main
# transporter scheduled to kill
execute as @e[tag=gateway.transporter_to_kill] at @s run function tulip_transport:system/transport/to_kill/main