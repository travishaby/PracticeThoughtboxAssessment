
$(document).ready(function(){
  bindInitialListeners();
})

function bindInitialListeners(){
  $('.read').each(function(index, button){
    $(button).on('click', function(){
      markAs($(this).parent(), 'true');
    });
  });

  $('.unread').each(function(index, button){
    $(button).on('click', function(){
      markAs($(this).parent(), 'false');
    })
  });
}

function markAs(link, isRead) {
  if(link.attr('data-read') !== isRead){
    var data = {link: {
      read: isRead
    }}
    var newIsRead = (isRead === "true").toString()
    $.ajax({
        url: "api/v1/links/" + link.attr('data-id'),
        method: "PUT",
        data: data,
        success: function(){
          $(link).attr('data-read', newIsRead);
          $(link).find('.read-status').text('Read? ' + newIsRead);
        },
        error: function(response){
          console.log(response, "update failed")
        }
    });
  }
}
