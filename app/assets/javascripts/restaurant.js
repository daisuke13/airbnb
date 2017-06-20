(function() {
  var apiResult;
  var url = 'http://api.gnavi.co.jp/RestSearchAPI/20150630/?callback=?';
  var params = {
    keyid: 'a8a1db088478b8d25870b56d45567274',
    format: 'json',
    latitude: 35.670083,
    longitude: 139.763267,
    hit_per_page: 50,
    range: 1
  };

  var showResult = function(result) {
    apiResult = result;
    if ( result.total_hit_count > 0 ) {
      alert( result.total_hit_count + '件の結果が見つかりました。\n' );
      for ( var i in result.rest ) {
        if ( typeof(result.rest[i].image_url.shop_image1) !== "object" || typeof(result.rest[i].image_url.shop_image2) !== "object" )
          $('.restaurants-info').append("<p><input type=checkbox class=checkbox value=" + i + ">" + "<img src=" + result.rest[i].image_url.shop_image1 + ">" + result.rest[i].name + "</p>");
        }
        $('.host-restaurants_result').append("<input id=restaurantBtn type=button value=" + "選択したレストランを表示" + ">");
    } else {
      alert( '検索結果が見つかりませんでした。' );
    }
  }

  $(document).on('click', '.js-apply', function() {
    $.getJSON(url, params, function(result) {
      showResult(result);
    });
  });


$(document).on('click', '#restaurantBtn', function() {
  var $checkedbox = $('.checkbox:checked');
  var idx = [];

  $checkedbox.each(function(i,ele) {
    idx[i] = $(ele).attr("value");
  });
  $('.host-restaurants_result').append("<h4>" + "選択したレストラン" + "</h4>");
  $.each(idx,function(i,ele) {
    $('.host-restaurants_result').append("<p>" + "<img class=rest-img src=" + apiResult.rest[ele].image_url.shop_image1 + ">" + apiResult.rest[ele].name + "</p>");
  });
  $('.host-restaurants_result').append("<input id=next-page type=button value=" + "次へ" + ">");
});

$(document).on('click', '#next-page', function() {
  var $checkedbox = $('.checkbox:checked');
  var idx = [];
  $checkedbox.each(function(i,ele) {
    idx[i] = $(ele).attr("value");
  });
  var restaurantsData = []
  $.each(idx, function(i,id) {
    restaurantsData.push({name: apiResult.rest[id].name, image: apiResult.rest[id].image_url.shop_image1, url: apiResult.rest[id].url})
  })
  $.ajax({
    type: 'POST',
    url: './',
    data: JSON.stringify({restaurants: restaurantsData}),
    contentType: 'application/json',
    dataType: 'json'
  })
})


})(jQuery);
