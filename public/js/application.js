$(document).ready(function() {
  // This is called after the document has loaded in its entirety
  // This guarantees that any elements we bind to will exist on the page
  // when we try to bind to them

  // See: http://docs.jquery.com/Tutorials:Introducing_$(document).ready()
  $('#new_question_button').click(function(){
    $('#new_question_button').hide();
    $('#new_question_form').show();
  });

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
      $('#new_question_form').hide();
      $('#new_question_button').show();
    })
  })

  $('#new_answer_button').click(function(){
    $('#new_answer_button').hide();
    $('#new_answer_form').show();
  });

  $('#new_answer_form').on("submit", function(){
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
      $('textarea#answer_text').val("");
      $('article').append(response);
      $('#new_answer_form').hide();
      $('#new_answer_button').show();
    })
  })

   $('#new_answer_comment_button').click(function(){
    $('#new_answer_comment_button').hide();
    $('#new_answer_comment_form').show();
  });

  $('#new_answer_comment_form').on('submit', function(){
    event.preventDefault();
    var $form = $(this);
    var url = $form.attr("action");
    var method = $form.attr("method");
    var data = $form.serialize();

    var request = $.ajax({
      url: url,
      method: method,
      data: data
    })
    request.done(function(response){
      $('textarea#answer_comment_text').val("");
      $('.answer').append(response);
      $('#new_answer_comment_form').hide();
      $('#new_answer_comment_button').show();
    })
  });

  $('#new_question_comment_button').click(function(){
    $('#new_question_comment_button').hide();
    $('#new_question_comment_form').show();
  });

  $('#new_question_comment_form').on('submit', function(){
    event.preventDefault();
    var $form = $(this);
    var url = $form.attr("action");
    var method = $form.attr("method");
    var data = $form.serialize();

    var request = $.ajax({
      url: url,
      method: method,
      data: data
    })
    request.done(function(response){
      $('textarea#question_comment_text').val("");
      $('.question').append(response);
      $('#new_question_comment_form').hide();
      $('#new_question_comment_button').show();
    })
  });


  $("#star_answer").on("click", "#best_answer", function() {
    $("#best_answer.active").removeClass('active');
    $(this).addClass('active');
  });


  $('#question-up-vote').on('submit', function(){
    event.preventDefault();

    var $form = $(this);
    var url = $form.attr("action");
    var method = $form.attr("method");
    var data = {vote_value: 1};

    var request = $.ajax({
      url: url,
      method: method,
      data: data
    })
    request.done(function(response){
      $('#total_votes').empty().append(response);
    })
  });

  $('#question-down-vote').on('submit', function(){
    event.preventDefault();

    var $form = $(this);
    var url = $form.attr("action");
    var method = $form.attr("method");
    var data = {vote_value: -1};

    var request = $.ajax({
      url: url,
      method: method,
      data: data
    })
    request.done(function(response){
      $('#total_votes').empty().append(response);
    })
  });

    $('#answer-up-vote').on('submit', function(){
    event.preventDefault();

    var $form = $(this);
    var url = $form.attr("action");
    var method = $form.attr("method");
    var data = {vote_value: 1};

    var request = $.ajax({
      url: url,
      method: method,
      data: data
    })
    request.done(function(response){
      $('.total_votes').empty().append(response);
    })
  });

  $('#answer-down-vote').on('submit', function(){
    event.preventDefault();

    var $form = $(this);
    var url = $form.attr("action");
    var method = $form.attr("method");
    var data = {vote_value: -1};

    var request = $.ajax({
      url: url,
      method: method,
      data: data
    })
    request.done(function(response){
      $('.total_votes').empty().append(response);
    })
  });

});
