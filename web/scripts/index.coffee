jQuery ->
  # generate the student input
  student_source = $("#student-template").html()
  student_template = Handlebars.compile(student_source)
  student_count = 1

  add_student_div = ->
    student_context = {count: student_count}
    student_count = student_count + 1
    student_html = student_template(student_context)
    $("#student-list" ).append(student_html)

  add_student_div()

  $("#add-student-button").click ->
    add_student_div()

  $(document).on 'click', ".remove-student-button", (event) ->
    event.preventDefault()
    $(this).closest(".student-element").remove()

