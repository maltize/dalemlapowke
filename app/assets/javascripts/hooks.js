$(document).ready(function(){
   $('#kind_filter select').change(function(){
       $(this).closest("form").submit();
    });
});