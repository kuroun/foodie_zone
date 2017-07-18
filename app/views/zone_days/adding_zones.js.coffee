
$(document.body).append("<%=j render partial: 'adding_zone_form' %>")
$('#add-zone-<%=@day.id%>').modal({backdrop: 'static', keyboard: false})
$('#add-zone-<%=@day.id%>').modal('show')
