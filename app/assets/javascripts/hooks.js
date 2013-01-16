$(document).ready(function(){
   $('#kind_filter #kind').change(function(){
       $(this).closest("form").submit();
    });
});