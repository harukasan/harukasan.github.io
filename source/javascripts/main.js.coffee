google.load "feeds", "1"

Index =
  renderQiita: ->
    Qiita.items "harukasan", (data) ->
      # console.log data
      template = Hogan.compile $('#qiita-entries-template').text()
      $(".qiita-entries").append template.render(items: data[0..4])

  renderFeed: ->
    toDD = (int) ->
      if int < 10 then "0#{int}" else "#{int}"

    Feed.items "http://blog.harukasan.jp/feed", (feed) ->
      console.log feed
      template = Hogan.compile $('#blog-entries-template').text()
      items = []
      for entry in feed.entries[0..4]
        date = new Date entry.publishedDate
        items.push
          year: date.getFullYear()
          month: toDD date.getMonth()
          day: toDD date.getDay()
          title: entry.title
          content: entry.contentSnippet
          link: entry.link
      $(".blog-entries").append template.render(items: items)

$(document).ready ->
  Index.renderQiita()
  Index.renderFeed()
  $(".slide-popover").popover()

  $(window).scroll ->
    deg = -1 * $(document).scrollTop() / $(window).height() * 360
    $("#haruneko").css {
      "-moz-transform": "rotate(#{deg}deg)",
      "-o-transform": "rotate(#{deg}deg)",
      "-webkit-transform": "rotate(#{deg}deg)",
      "transform": "rotate(#{deg}deg)",
    }
