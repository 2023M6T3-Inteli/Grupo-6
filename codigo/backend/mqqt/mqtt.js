const mqtt = require('mqtt')

// To connect, we configure a docker container
const protocol = 'mqtt'
const host = 'broker.emqx.io'
const port = '1883'
const clientId = `mqtt_${Math.random().toString(16).slice(3)}`

const connectUrl = `${protocol}://${host}:${port}`


// Connect with the broker
const client = mqtt.connect(connectUrl, {
  clientId,
  clean: true,
  connectTimeout: 4000,
  username: 'emqx',
  password: 'public',
  reconnectPeriod: 1000,
})

client.on('connect', () => {
  console.log('Connected')
})


// Subscribe to a topic - recommendation
const topic = 'recommendation'

client.on('connect', () => {
  console.log('Connected')
  client.subscribe([topic], () => {
    console.log(`Subscribe to topic '${topic}'`)
  })
})

client.on('message', (topic, payload) => {
    let message = JSON.parse(payload.toString())
    console.log('Received Message:', topic, payload.toString())
  })

// Disconnect
client.end()

// Callback for disconnection
client.end(false, {}, () => {
  console.log('client disconnected')
})

export default message