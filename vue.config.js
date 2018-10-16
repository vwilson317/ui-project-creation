module.exports = {
    configureWebpack: {
      devtool: 'source-map'
    },
    devServer: {
      proxy: {
        '/api': {
          //TODO: replace with local api if needed
          // target: 'http://localhost:34199',
          ws: true,
          changeOrigin: true
        }
      }
    }
  }
  