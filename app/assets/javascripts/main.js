$(function() {
  $('.add-comment').on('click', function() {
    id = this.dataset.id;
    form = $.find(".comment-form[data-id='" + id + "']")[0];
    $(form).fadeToggle();
  });

  $('.submit-comment').on('click', function(e) {
    e.preventDefault();
    form = $(this.parentElement);
    $.post('main/create_comment', {
      author: form.find('input[name="author"]')[0].value,
      content: form.find('input[name="content"]')[0].value,
      post_id: this.dataset.id
    }, function(data) {
      $('#msg').html(data.msg);
      $('#alert').fadeIn().removeClass('hidden');
      form.fadeOut();
    });
  });

  $('.show-comments').on('click', function() {
    id = this.dataset.id;
    comments = $.find(".comments[data-id='" + id + "']")[0];
    $(comments).fadeToggle();
  });
});