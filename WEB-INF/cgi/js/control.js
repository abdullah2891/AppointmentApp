$( document ).ready(function() {
  var url = "getAppointment.pl";
  $.getJSON(url).then(function(data){
    var items = ["<tr><th>Appointment Date</th><th>Appointment</th></tr>"];
    $.each( data, function( key, val ) {
      console.log(key,val);
      items.push( "<tr>"+"<td>"+key+"</td>" + "<td>"+ val + "</td>"+"</tr>" );
    });

    $( "<table/>", {
      "class": "my-new-list",
      html: items.join( "" )
    }).appendTo( "#list" );  })
});
