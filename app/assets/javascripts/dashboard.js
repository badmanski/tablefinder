$(function() {
  $('#new-post').click(function() {
    $('#post-form').fadeIn().removeClass('hidden');
    $(this).addClass('hidden');
  });

  $('#submit-post').click(function() {
    $.post('dashboard/create_post', {
      title: $('#title').val(),
      content: $('#content').val(),
      user_id: $('#user_id').val()
    }, function(data) {
      $('#msg').html(data.msg);
      $('#alert').fadeIn().removeClass('hidden');
      $('#post-form').addClass('hidden');
      $('#new-post').fadeIn().removeClass('hidden');
    });
  });
});
