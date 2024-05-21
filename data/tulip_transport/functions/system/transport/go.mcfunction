# tulip transport
## gateway to transport player


# summon slime to be ridden by player
## ~~needs to be assigned uuid (hence the tag)~~
summon slime ~ ~ ~ {NoGravity:1b,Silent:1b,Invulnerable:1b,PersistenceRequired:1b,NoAI:1b,Tags:["gateway.transporter","gateway.transporter.to_assign"]}

# copy gateway type
## required to transport you to the right gateway
execute if entity @s[tag=gateway.type_1] run tag @e[tag=gateway.transporter.to_assign,limit=1] add gateway.transporter.type_1
execute if entity @s[tag=gateway.type_2] run tag @e[tag=gateway.transporter.to_assign,limit=1] add gateway.transporter.type_2

# assign uuid to player
#execute as @a[tag=gateway.player_to_transport,limit=1,sort=nearest] run scoreboard players operation @e[tag=gateway.transporter.to_assign,limit=1] temp_store.uuid.0 = @s temp_store.uuid.0
#execute as @a[tag=gateway.player_to_transport,limit=1,sort=nearest] run scoreboard players operation @e[tag=gateway.transporter.to_assign,limit=1] temp_store.uuid.1 = @s temp_store.uuid.1
#execute as @a[tag=gateway.player_to_transport,limit=1,sort=nearest] run scoreboard players operation @e[tag=gateway.transporter.to_assign,limit=1] temp_store.uuid.2 = @s temp_store.uuid.2
#execute as @a[tag=gateway.player_to_transport,limit=1,sort=nearest] run scoreboard players operation @e[tag=gateway.transporter.to_assign,limit=1] temp_store.uuid.3 = @s temp_store.uuid.3

# get player to ride
ride @a[tag=gateway.player_to_transport,limit=1,sort=nearest] mount @e[tag=gateway.transporter.to_assign,limit=1]

# add player on cooldown
tag @a[tag=gateway.player_to_transport,limit=1,sort=nearest] add gateway.player_on_cooldown

tag @a[tag=gateway.player_to_transport,limit=1,sort=nearest] remove gateway.player_to_transport
tag @e[tag=gateway.transporter.to_assign,limit=1] remove gateway.transporter.to_assign