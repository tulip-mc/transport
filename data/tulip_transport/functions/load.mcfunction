# tulip /reload


scoreboard objectives add temp_store.gateway.player_on_cooldown_timer dummy
scoreboard players set gateway.player_cooldown tulip.config 80

scoreboard objectives add temp_store.gateway.transporter_to_kill_timer dummy
scoreboard players set gateway.transporter_kill tulip.config 7

scoreboard objectives add tulip_transport.gateway.location dummy