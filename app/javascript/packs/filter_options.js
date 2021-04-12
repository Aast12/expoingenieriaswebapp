window.filterOptions = function() {
  var url = '/filter_options?filter_type=' + $('#filter-by').val()
  $.get(url, function(data) {
    var select = $('#filter-value');
    select.attr('name', $('#filter-by').val())
    select.empty()
    $.each(data, function(_, key) {
	    select.append( $('<option></option>').val(key[1]).html(key[0]) );
    });
  });
}