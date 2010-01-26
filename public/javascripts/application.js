$(document).ready(function(){
  $("input[id^='u-']").change(function(){
    var field = $(this)
    var answer = field.val()
    var unit_id = /\d+/.exec(/u-\d+/.exec(field.attr('id')))
    var exercise_id = /\d+/.exec(/e-\d+/.exec(field.attr('id')))
    var sentence_id = /\d+/.exec(/s-\d+/.exec(field.attr('id')))

    if(answer != '') {
      $.ajax({
        type: 'GET',
        url: '/units/' + unit_id + '/exercises/' + exercise_id + '/sentences/' + sentence_id + '/check',
        data: {answer: answer},
        success: function(response) {
          field.attr('class', 'good')
        },
        error: function(response) {
          field.attr('class', 'bad')
        }
      })
    } else {
      field.attr('class', '')
    }
  })
})
