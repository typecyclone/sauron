var chokidar = require('chokidar')

exports.createWatcher = function (pattern) {
  return function () {
    return chokidar.watch(pattern, {
      ignored: /(^|[\/\\])\../,
      persistent: true
    })
  }
}

exports.addListener = function (watcher) {
  return function (eventName) {
    return function (fun) {
      return function () {
        watcher.on(eventName, function (p) {
          return fun(p)()
        })
      }
    }
  }
}

