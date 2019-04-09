. "$PSScriptRoot\question.ps1"

$correctAnswer = 0

ForEach ($q in $question_set) {
  $options = $q.GetOptions()
  Write-Host "Question: $($q.GetQuestion())"
  for ($i = 0; $i -le $options.length - 1 ; $i++) {
    Write-Host "$($i+1). $($options[$i])"
  }

  $answerNumber = 0
  do {
    $answerNumber = Read-Host "Give option number "
  } while (([int]$answerNumber -ge 5) -or ([int]$answerNumber -le 0))

  if (($q.CheckRightAnswer($options[$([int]$answerNumber - 1)]))) {
    $correctAnswer += 1
  }
  Write-Host
}
Write-Host "Your score is $($correctAnswer) out of $($options.length - 2)" -ForegroundColor Yellow