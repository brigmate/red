function afterLoad() {
  $('.wall-item-content-wrapper').each(function() {
    $(this).find('.wall-item-info').append($(this).find('.wall-item-tools'));
  });

  $('.wall-item-tools').each(function() {
    $(this).removeClass('pull-left');
    $(this).removeClass('pull-right');
  });

  $('.wall-item-tools-left').each(function() {
    $(this).removeClass('pull-left');
  });

  $('.wall-item-tools-right').each(function() {
    $(this).removeClass('pull-right');
  });
}

$(document).ready(function() {
    $("body").bind("ajaxComplete", function(e, xhr, settings){
//           afterLoad();
    });
});
