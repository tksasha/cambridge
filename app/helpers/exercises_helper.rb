module ExercisesHelper
  def link_to_add_exercise
    link_to '+', '#', :class => 'add-exercise', :title => 'show new exercise field', :id => 'show-form-for-new-exercise'
  end

  def link_to_edit_exercise exercise
    link_to 'edit', edit_unit_exercise_path(@unit, exercise), :class => 'add-exercise'
  end

  def link_to_delete_exercise exercise
    link_to_remote 'delete', :url => unit_exercise_path(@unit, exercise), :method => :delete, :confirm => I18n.t(:'are you sure?'), :failure => 'alert(request.responseText)', :html => { :class => 'add-exercise' }
  end
end
