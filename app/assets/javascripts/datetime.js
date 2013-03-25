$.datepicker.setDefaults({ dateFormat: 'yy-mm-dd' });

$(document).ready(function(){
  $('input.ui-date-picker').datepicker();
  $('input.ui-datetime-picker').datetimepicker();
});
