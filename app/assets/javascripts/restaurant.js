(function(){

  var url = 'http://api.gnavi.co.jp/RestSearchAPI/20150630/?callback=?';
  var params = {
    keyid: 'a8a1db088478b8d25870b56d45567274',
    format: 'json',
    latitude: 35.670083,
    longitude: 139.763267,
    range: 1
  };

  var showResult = function(result){
    if ( result.total_hit_count > 0 ) {
      var res = '';
      alert( result.total_hit_count + '件の結果が見つかりました。\n' );
      for ( var i in result.rest ){
          res += result.rest[i].id + ' ' + result.rest[i].name + ' ' + result.rest[i].access.line + ' ' + result.rest[i].access.station + ' ' + result.rest[i].access.walk + '分\n';
          $('.test').append(result.rest[i].name);
      }
    } else {
      alert( '検索結果が見つかりませんでした。' );
    }
  }

  $(document).on('click', '.js--apply', function(){
    $.getJSON(url, params, function(result){
      console.log(result);
      showResult(result);
    });
  });

})(jQuery);
