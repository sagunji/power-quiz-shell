Class Question {
  [string] $question;
  [string] $option1;
  [string] $option2;
  [string] $option3;
  [string] $option4;
  [string] $rightOption;
  
  Question([string] $question, [string] $option1, [string] $option2, [string] $option3, [string] $option4, [string] $rightOption) {
    $this.question = $question;
    $this.option1 = $option1;
    $this.option2 = $option2;
    $this.option3 = $option3;
    $this.option4 = $option4;
    $this.rightOption = $rightOption;
  }

  [string] GetQuestion() {
    return $this.question
  }

  [array] GetOptions() {
    $options = New-Object System.Collections.ArrayList;
    $options.Add($this.option1);
    $options.Add($this.option2);
    $options.Add($this.option3);
    $options.Add($this.option4);
    return $options
  }

  [bool] CheckRightAnswer([string] $value) {
    return ($value -eq $this.rightOption)
  }
}

$question_set = @()

# Import configuration CSV
$questionaires = Import-Csv ".\question-set.csv"

ForEach ($ques in $questionaires) {
  $question = [Question]::new($ques.question, $ques.option1, $ques.option2, $ques.option3, $ques.option4, $ques.($ques.rightOption))
  $question_set += $question
}




