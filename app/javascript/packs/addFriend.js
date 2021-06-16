$(document).ready(function(e){
  $(document).on('click', 'button.add_fiend', function(){
    let userId = $(this).data('user-id');
    $.ajax({
      method: 'POST',
      url: gon.url_get_quotations,
      dataType: 'json',
      data: {
        'user_id': userId,
      },
      headers: {
        "X-CSRF-Token": $('meta[name="csrf-token"]').attr("content"),
      }
    })
    .done(function(data) {

    })
    .fail(function(){})

  })
})