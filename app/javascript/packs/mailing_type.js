jQuery(function(){
  $('input[type=radio][name=type]').change(function (e) {
    var project = $('#type_project');
    var single =  $('#type_indv');
    var receiver = $('#receiver');
    var nomenclature = $('#nomenclature');
    if ($(this).val() == 'single') {
      project.hide()
      receiver.hide()
      nomenclature.hide()
      single.show()
    } else {
      single.hide()
      project.show()
      receiver.show()
      nomenclature.show()
    }
  });
});