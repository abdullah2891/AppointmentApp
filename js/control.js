$( document ).ready(function() {
  var url = "cgi-bin/getAppointment.pl";
  $(".btn").click(function(){
    $.getJSON(url).then(function(data){
      var items = ["<div class='panel-heading'><tr><th>Appointment Date</th><th>Appointment</th></tr></div>"];
      $.each( data, function( key, val ) {
        console.log(key,val);
        items.push( "<tr>"+"<td>"+key+"</td>" + "<td>"+ val + "</td>"+"</tr>" );
      });

      $( "<table/>", {
        "class": "my-new-list",
        html: items.join( "" )
      }).appendTo( "#list" );  });
  })


});
