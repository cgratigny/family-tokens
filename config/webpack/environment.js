// config/webpack/environment.js
const { environment } = require('@rails/webpacker')
const erb = require('./loaders/erb')
const webpack = require('webpack')

// const coffee =  require('./loaders/coffee')
// environment.loaders.prepend('coffee', coffee)
//
// const erb =  require('./loaders/erb')
// environment.loaders.prepend('erb', erb)

environment.plugins.prepend(
    'Provide',
    new webpack.ProvidePlugin({
      $: 'jquery',
      jQuery: 'jquery',
      jquery: 'jquery',
      'window.jQuery': 'jquery',
      Popper: ['popper.js', 'default'],
    })
)

module.exports = environment
