

class Qiita
  items: (user, onsuccess) ->
    $.ajax
      type: "GET",
      url: "https://qiita.com/api/v1/users/#{user}/items",
      success: onsuccess

window.Qiita = new Qiita

