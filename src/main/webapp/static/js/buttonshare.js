 jQuery(document).ready(function($) {
 $('.share').click(function() {
 var NWin = window.open($(this).prop('href'), '', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=300,width=600');
 if (window.focus)
 {
 NWin.focus();
 }
 return false;
 });
});