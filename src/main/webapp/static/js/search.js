$(document).ready(function() {
   $('#myInput').on('keyup', function(event) {
      event.preventDefault();
      /* Act on the event */
      var tukhoa = $(this).val().toLowerCase();

      $('#myTable tr').filter(function() {
         $(this).toggle($(this).text().toLowerCase().indexOf(tukhoa)>-1);
      });
   });
   
		   $(":checkbox.chk-vehicle").change(function(){
			   var chks = [];
			   $(":checked.chk-vehicle").each((i, chk) => {
				   chks.push($(chk).val().trim().toLowerCase());
			   })
				$("#myTable tr").each((index, tr) => {
					var td = $(tr).find("td:eq(7)");
					var tdtt = $(tr).find("td:eq(8)");
					$(tr).hide();
					if(chks.includes(td.text().trim().toLowerCase()) && chks.includes(tdtt.text().trim().toLowerCase())){
						$(tr).show();
						
					}
				});
		   });
		   $(":checkbox.chk-vehicle").prop("checked", true);
		   $(":checkbox.chk-vehicle").change();
});


            