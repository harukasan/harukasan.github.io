#= require bootstrap/scrollspy
#= require bootstrap/tooltip
#= require bootstrap/popover
#= require qiita

$(document).ready ->
  Qiita.items "harukasan", (data) ->
    console.log data
    template = Hogan.compile($('#qiita-entries-template').text())
    $(".qiita-entries").append(template.render(items: data[0..4]))

  $(".slide-popover").popover()

  $(window).scroll ->
    deg = -1 * $(document).scrollTop() / $(window).height() * 360
    $("#haruneko").css {
      "-moz-transform": "rotate(#{deg}deg)",
      "-o-transform": "rotate(#{deg}deg)",
      "-webkit-transform": "rotate(#{deg}deg)",
      "transform": "rotate(#{deg}deg)",
    }
