$('<%= escape_javascript(render(:partial => @question))%>')
  .appendTo('#questions')
  .hide()
  .fadeIn()
 
$('#new_question')[0].reset()
 
('#questions_count').html '<%= questions_count %>'

$(' #upvote_<%=question.id %>').html '<%= question.scoreu %>'
