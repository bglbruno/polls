function ready() {
  $('.chart.yes').easyPieChart({
    barColor: '#8bc34a',
    lineWidth: 5,
    scaleLength: 10
  });
  $('.chart.no').easyPieChart({
    barColor: '#ff5252',
    lineWidth: 5,
    scaleLength: 10
  });

  $('.btn_stats').on('click', function(){
    var $this = $(this);
    var $p = $this.parent().find('.stats');
    if( $p.hasClass('expanded') ) {
      $p.removeClass('expanded').slideUp();
    }else{
      $('.stats').removeClass('expanded').slideUp();
      $p.addClass('expanded').slideDown();
    }
  });

};
$(document).ready(ready);
$(document).on('page:load', ready);
