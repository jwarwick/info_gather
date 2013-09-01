jQuery ->
  student_source = $("#student-template").html()
  student_template = Handlebars.compile(student_source)
  student_count = 1

  parent_source = $("#parent-template").html()
  parent_template = Handlebars.compile(parent_source)
  parent_count = 1

  $(document).on 'change', ".grade-select", (event) ->
    idx = $(this).val()
    arr = $("#teacher-data").data("teachers")
    teacher_select = $(this).closest(".student-element").find(".teacher-select")
    $(teacher_select).empty()
    for name, i in arr[idx]
      $(teacher_select).append("<option value=\"#{i}\">#{name}</option>")

  update_student_remove_buttons = ->
    if $(".student-element").length > 1
      $(".remove-student-button").removeAttr("disabled")
    else
      $(".remove-student-button").attr("disabled", "disabled")
    
  add_student_div = ->
    student_context = {count: student_count}
    student_count = student_count + 1
    student_html = student_template(student_context)
    $("#student-list" ).append(student_html)
    update_student_remove_buttons()
    $("#student-list").children().last().find(".grade-select").change()

  add_student_div()

  $("#add-student-button").click ->
    add_student_div()

  $(document).on 'click', ".remove-student-button", (event) ->
    event.preventDefault()
    $(this).closest(".student-element").remove()
    update_student_remove_buttons()



  update_parent_remove_buttons = ->
    if $(".parent-element").length > 1
      $(".remove-parent-button").removeAttr("disabled")
    else
      $(".remove-parent-button").attr("disabled", "disabled")
    
  add_parent_div = ->
    parent_context = {count: parent_count}
    parent_count = parent_count + 1
    parent_html = parent_template(parent_context)
    $("#parent-list" ).append(parent_html)
    update_parent_remove_buttons()
    $("#parent-list").children().last().find(".grade-select").change()

  add_parent_div()

  $("#add-parent-button").click ->
    add_parent_div()

  $(document).on 'click', ".remove-parent-button", (event) ->
    event.preventDefault()
    $(this).closest(".parent-element").remove()
    update_parent_remove_buttons()

