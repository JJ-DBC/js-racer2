$(document).ready(function() {
  // This is called after the document has loaded in its entirety
  // This guarantees that any elements we bind to will exist on the page
  // when we try to bind to them
  // See: http://docs.jquery.com/Tutorials:Introducing_$(document).ready()
  setTimeout(function(){
    var player1 = $('#player1').text();
    var player2 = $('#player2').text();
    var startTime = new Date();
    var endTime;
    $('#GO').css({'display':'block'});
    $(document).bind('keyup', function(e){
      if(e.keyCode == 81){
        $('body').css({'background-color':'lightpink'});
         var current_pos = $('#player1_strip').find('.active');
         var last_pos = $('#player1_strip').children('td:last-child').index();
         current_pos.next().addClass('active');
         if(current_pos.index() == last_pos){
            endTime = new Date();
            var totalTime = endTime.getTime() - startTime.getTime();
            var results = {winner:totalTime,winner: "player1"};
            $(document).unbind();
            $.post('/results',results);

         }
         current_pos.removeClass('active');
      }
      if(e.keyCode == 80){
        $('body').css({'background-color':'lightblue'});
         var current_pos = $('#player2_strip').find('.active');
         var last_pos = $('#player2_strip').children('td:last-child').index();
         current_pos.next().addClass('active');
         if(current_pos.index() == last_pos){
            $(document).unbind();
            window.location = '/win/player2';
         }
         current_pos.removeClass('active');
      }

    });

  },2000);
});
