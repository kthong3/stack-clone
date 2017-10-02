$(document).ready(function() {
  // This is called after the document has loaded in its entirety
  // This guarantees that any elements we bind to will exist on the page
  // when we try to bind to them

  // See: http://docs.jquery.com/Tutorials:Introducing_$(document).ready()

  //  NEW QUESTION BUTTON ON HOME PAGE
  $('.wrapper').on('click', '.new_question_button', function(){
    $('.new_question_button').hide();
    $('.new_question_form').show();
  });

  // NEW QUESTION FORM ON HOME PAGE
  $('.question-container').on("submit", '.new_question_form', function(){
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
      $('.new_question_form').hide();
      $('.new_question_button').show();
    })
  })

  // NEW ANSWER BUTTON
  $('.question-container').on('click', '.new_answer_button', function(){
    $('.new_answer_button').hide();
    $('.new_answer_form').show();
  });

  // NEW ANSWER FORM ON THE QUESTIONS PAGE
  $('.question-container').on("submit", '.new_answer_form', function(){
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
      $('.new_answer_form').hide();
      $('.new_answer_button').show();
    });
  });

   $('.question-container').on('click', '.new_answer_comment_button', function(){
    $(this).hide();
    $(this).siblings('.new_answer_comment_form').show();
  });

  $('.question-container').on('submit', '.new_answer_comment_form', function(){
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
      $('.answer_comment_text').val("");
      $form.closest('.answer-wrapper').find('.answer').append(response);
      $('.new_answer_comment_form').hide();
      $('.new_answer_comment_button').show();
    })
  });


  $('.question-container').on('click', '.new_question_comment_button', function(){
    $('.new_question_comment_button').hide();
    $('.new_question_comment_form').show();
  });

  $('.question-container').on('submit', '.new_question_comment_form', function(){
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
      $('textarea.question_comment_text').val("");
      $('.question').append(response);
      $('.new_question_comment_form').hide();
      $('.new_question_comment_button').show();
    })
  });


  $("#star_answer").on("click", "#best_answer", function() {
    $("#best_answer.active").removeClass('active');
    $(this).addClass('active');
  });


  $('.question-container').on('submit', '#question-up-vote', function(){
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

  $('.question-container').on('submit', '#question-down-vote', function(){
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

    $('.question-container').on('submit', '#answer-up-vote', function(){
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
      $form.parent().find('.total_votes').empty().append(response);
    })
  });

  $('.question-container').on('submit', '#answer-down-vote', function(){
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
      $form.parent().find('.total_votes').empty().append(response);
    })
  });

});
