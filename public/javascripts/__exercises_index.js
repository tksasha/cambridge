$(document).ready(function() {
  exercises_bind()
  sentences_bind()
  answers_bind()
})

function parseInt(e) {
  return (/\d+/.exec(e))
}

function exercises_bind(){
  $('a[id^="show-form-for-new-exercise-"]').toggle(
    function(){
      var unit_id = parseInt($(this).attr('id'))  

      $(this).text('-') 
      $(this).attr('title', 'hide form for new exercise')

      $('li[id="form-for-new-exercise-' + unit_id + '"]').show()
      $('input[name="exercise[number]"]').focus()
    },
    function(){
      var unit_id = parseInt($(this).attr('id'))  

      $(this).text('+') 
      $(this).attr('title', 'show form for new exercise')
      
      $('li[id="form-for-new-exercise-' + unit_id + '"]').hide()
    }
  )
}

function sentences_bind() {
  $('a[id^="show-form-for-new-sentence-"]').toggle(
    function() {
      var exercise_id = parseInt($(this).attr('id'))

      $(this).text('-') 
      $(this).attr('title', 'hide form for new sentence')

      $('li[id="form-for-new-sentence-' + exercise_id + '"]').show()
      $('input[id="sentence_number_' + exercise_id +'"]').focus()
    },
    function() {
      var exercise_id = parseInt($(this).attr('id'))  

      $(this).text('+') 
      $(this).attr('title', 'show form for new sentence')
      
      $('li[id="form-for-new-sentence-' + exercise_id + '"]').hide()
    }
  )
}

function answers_bind() {
  $('a[id^="show-form-for-new-answer-"]').toggle(
    function() {
      var sentence_id = parseInt($(this).attr('id'))

      $(this).text('-') 
      $(this).attr('title', 'hide form for new answer')

      $('li[id="form-for-new-answer-' + sentence_id + '"]').show()
      $('input[id="answer_text_' + sentence_id +'"]').focus()
    },
    function() {
      var sentence_id = parseInt($(this).attr('id'))  

      $(this).text('+') 
      $(this).attr('title', 'show form for new answer')
      
      $('li[id="form-for-new-answer-' + sentence_id + '"]').hide()
    }
  )
}
