
$(document).on("ready", function() {
    console.log("-- Page Load --");
  
  $(document).on('cocoon:before-insert', 'form', function(e,field_to_be_added) {
    console.log(field_to_be_added);
    console.log("field add - before-insert");
    e.stopPropagation();
    field_to_be_added.fadeIn('slow');
  });
  
  $(document).on('cocoon:after-insert', 'form', function(e,field_to_be_added) {
    console.log(field_to_be_added);
    console.log("field add - after-insert");
    e.stopPropagation();
    field_to_be_added.fadeIn('slow');
  });

  $('.states').on('cocoon:before-remove', function(e, state_to_remove) { 
    console.log("Remove State");
    $(this).data('remove-timeout', 1000); 
    state_to_remove.fadeOut('slow'); 
    e.stopPropagation();
    });
    
  $('.counties').on('cocoon:before-remove', function(e, county_to_remove) { 
    console.log("Remove County");
    $(this).data('remove-timeout', 1000); 
    county_to_remove.fadeOut('slow'); 
    e.stopPropagation();
  });

});