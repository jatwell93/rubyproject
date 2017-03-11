$('#fields').on('cocoon:after-insert', (e, inserted_item) ->
  num = $('.fields').length
  inserted_item.find('.field-label').html('Field #'+num)
 )
