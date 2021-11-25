window.filterOptions = function() {
  var option = $('#filter-by').val()
  console.log(option)
  var url = '/filter_options?filter_type=' + option
  var select = $('#filter-select');
  var search = $('#filter-search');
  if (option == 'name') {
    select.hide();
    select.val([]);
    search.show();
    search.attr('name', option);
  } else {
    search.hide();
    search.attr('name', '');
    select.show();
    $.get(url, function(data) {
      select.attr('name', option)
      select.empty()
      $.each(data, function(_, key) {
        console.log(data)
        select.append( $('<option></option>').val(key[1]).html(key[0]) );
      });
    });
  }
}