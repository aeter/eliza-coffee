$ ->
  # cache the value:
  input_area = $('#user_input')

  clear_box = -> input_area.val('')

  $('#user_input').keyup ->
    user_text = input_area.val()
    $(".odd").last().text(">> " + user_text)

  $('#clear').click ->
    clear_box()
    $(".odd").last().text(">> ")
    input_area.focus()

  $('#say').click ->
    submit_text()
    input_area.focus()

  submit_text = () ->
    user_input = input_area.val()
    answer = eliza.respond_to(user_input)
    clear_box()
    append_html = "
       <span class=\"even\">>> #{ answer }</span><br>
       <span class=\"odd\">>> </span><br>"
    $('#content').append(append_html)
    input_area.focus()
    # scroll down the conversation:
    $("#content").scrollTop($("#content")[0].scrollHeight);
  
  # Bind Ctrl + Enter to submitting text
  $(document).keydown (e) ->  
    if e.ctrlKey and e.keyCode == 13
      submit_text()

