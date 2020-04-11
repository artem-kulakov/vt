$( document ).ready(function() {
  var notice = $('#notification');

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
});