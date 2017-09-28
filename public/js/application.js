$(document).ready(function() {
  // This is called after the document has loaded in its entirety
  // This guarantees that any elements we bind to will exist on the page
  // when we try to bind to them

  // See: http://docs.jquery.com/Tutorials:Introducing_$(document).ready()
  $('#new_question_form').on("submit", function(){
    event.preventDefault();
    var $form = $(this);
    var url = $form.attr("action");
    var method = $form.attr("method");
    var data = $form.serialize();

    var request = $.ajax({
      url: url,
      method: method,
      data: data
    });
    request.done(function(response){
      $('textarea#question_text').val("");
      $('article').append(response);
      console.log(response);
    })
  })
});
