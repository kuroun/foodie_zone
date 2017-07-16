
$(document.body).append("<%=j render partial: 'add_zone', locals: {available_zones: ''}%>")
$('#add-zone-<%=@day.id%>').modal({backdrop: 'static', keyboard: false})
$('#add-zone-<%=@day.id%>').modal('show')
