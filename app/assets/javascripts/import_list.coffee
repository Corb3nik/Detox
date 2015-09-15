# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$('.import_list.index').ready(->

  $('#check_all').on('change', (->

    $('[name="issue_ids[]"]').prop('checked', $(this).is(':checked'))
  ))

)
