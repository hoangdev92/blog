$(document).ready(function(e){
  setTimeout(function(){
    let fb_comement = $('body').find('iframe');
    if (fb_comement.length == 0) {
      location.reload(1);
    }
  }, 3000);
})