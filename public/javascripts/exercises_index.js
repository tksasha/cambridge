function parseInt(e) {
  var integer = (/\d+/.exec(e));
  if(integer) { integer = integer[0] } else { throw new Error("can't parse integer from: " + e) }
  return integer;
}

var Unit = function() {
  function init() {
    this.next_exercise_number = $('#unit_next_exercise_number').text();

    this.exercises = {};

    Exercises.init();
  }

  return { init: init }
  
}()

var Exercises = {
  init: function() {
    $('ol#exercises > li > span[id^="next-sentence-number-"]').each(function() {

      var exercise = Exercise.init(this);
      Unit.exercises[exercise.id] = exercise;
    })
  }
}

var Exercise = {
  init: function(el) {
    if(el) {
      el = $(el);
      
      if(el.length) {
        var id = parseInt(el.attr('id'));
        
        if(! typeof(id) == 'number') {
          throw new Error('id is not Integer')
        }

        var next_sentence_number = parseInt(el.text());

        if(! typeof(next_sentence_number) == 'number') {
          throw new Error('next_sentence_number is not Integer');
        }
        
        return ({id: id, next_sentence_number: next_sentence_number });
      } else {
        throw new Error('el not found');
      }
    } else {
      throw new Error('el is not defined');
    }
  },
  form: {
    reload: function() {
      $('input#exercise_number').val(Unit.next_exercise_number);
      $('input#exercise_description').val('').focus();
    }      
  }
}

var Sentence = {
  form: {
    reload: function(exercise_number) {
      $('input#sentence-number-' + exercise_number).val(Unit.exercises[exercise_number].next_sentence_number);
      $('input#sentence-text-' + exercise_number).val('').focus();
    }      
  }
}


$(document).ready(function() {
  Unit.init();

  $('a#toggle_new_exercise_form').toggle(
    function() {
      $('fieldset#new_exercise_form').show()
      $(this).text('hide form for new exercise')

      Exercise.form.reload()
    }, 
    function() {
      $('fieldset#new_exercise_form').hide()
      $(this).text('show form for new exercise')
    }
  )

  $('a[id^="toggle-new-sentence-form-"]').toggle(
    function() {
      var exercise_number = parseInt($(this).attr('id'));

      $('fieldset#for-new-sentence-' + exercise_number).show();

      Sentence.form.reload(exercise_number);

      $(this).text('hide form for new sentence')
    },
    function() {
      var number = parseInt($(this).attr('id'));
      $('fieldset#for-new-sentence-' + number).hide();
      $(this).text('show form for new sentence')
    }
  )
})
