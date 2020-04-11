$( document ).ready(function() {
  var notice = $('#notice');
  var alert = $('#alert');

  if (notice.length > 0) {
    (new PNotify({
        title: 'Notice',
        type: 'success',
        delay: 3000,
        text: notice.text(),
        desktop: {
            desktop: true,
            icon: 'assets/images/pnotify/success.png'
        }
    })
    );
  }

  if (alert.length > 0) {
    (new PNotify({
        title: 'Alert',
        type: 'warning',
        delay: 3000,
        text: alert.text(),
        desktop: {
            desktop: true,
            icon: 'assets/images/pnotify/warning.png'
        }
    })
    );
  }
});
