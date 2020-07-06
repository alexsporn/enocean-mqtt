#
# Copyright (c) 2020 Alexander Sporn. All rights reserved.
#

config = require './config.json'
mqtt = require 'mqtt'
Enocean = require './Enocean'

enocean = new Enocean(port: config.port)
console.log config
client = mqtt.connect(config.mqtt, username: config.mqtt_username, password: config.mqtt_password)

enocean.on 'pressed', (sender, button) =>
  console.log "enocean/#{sender}" + " - " + JSON.stringify {type: button}
  client.publish "enocean/#{sender}", JSON.stringify {type: button}
  
client.on 'connect', (packet) ->
  if packet.returnCode is 0
    console.log "Connected to #{config.mqtt}"
  else
    console.log "Connack error #{packet.returnCode}"
    process.exit 1

client.on 'reconnect', ->
  console.log "Reconnecting"

client.on 'close', ->
  console.log "Connection closed"

client.on 'error', (e) ->
  console.log "Error #{e}"
  process.exit 1