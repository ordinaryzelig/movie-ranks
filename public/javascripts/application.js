$(document).ready(function(){
  rounded_corners();
  button_states();
});

function rounded_corners() {
  // find all buttons and give them "rounded" class.
  $("button").each(function() {
    $(this).addClass("rounded");
  });
  $(".rounded").corner();
}

function button_states(){
  $("button").hover(
    function() {
      $(this).addClass("hover");
    },
    function() {
      $(this).removeClass("hover");
    }
  );
}
