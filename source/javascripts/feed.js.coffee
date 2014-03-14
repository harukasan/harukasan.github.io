
window.Feed =
  items: (url, callback) ->
    (new google.feeds.Feed(url)).load (result) ->
      return console.error error.message if result.error
      callback(result.feed)
