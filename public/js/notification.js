$( document ).ready(function() {
  if ($('#notification').length > 0) {
    // alert('bar');
    // var x = document.getElementById("notification");

    // x.className = "show";

    // setTimeout(function(){ x.className = x.className.replace("show", ""); }, 3000);

        (new PNotify({
            title: 'Danger Desktop Notice',
            type: 'danger',
            text: 'I\'m a danger desktop notification, if you have given me a permission.',
            desktop: {
                desktop: true,
                icon: 'assets/images/pnotify/danger.png'
            }
        })
        ).get().click(function(e) {
            if ($('.ui-pnotify-closer, .ui-pnotify-sticker, .ui-pnotify-closer *, .ui-pnotify-sticker *').is(e.target)) return;
            alert('Hey! You clicked the desktop notification!');
        });
  }
});