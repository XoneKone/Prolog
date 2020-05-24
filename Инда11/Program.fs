open System
open System.Windows.Forms
open System.Drawing

let form = new Form(Text = "Ind 11", Width = 500, Height = 300)
let button = new Button(Text = "Стереть все", Width = 150, Height =50)
let text = new TextBox( Width = 300, Height = 25,MaxLength =50)
let progress = new ProgressBar(Step = 1, Width =300, Height = 25, Style =ProgressBarStyle.Continuous, Maximum = 50)

text.Location<-new Point(100,100)

progress.Location<-new Point(100,50)

button.Location <- new Point (180,150)


form.Controls.Add(button)
form.Controls.Add(text)
form.Controls.Add(progress)

let Change _ = progress.Value <- text.Text.Length
let _ = text.TextChanged.Add(Change)

button.Click.Add(fun evArgs -> text.Clear() |>ignore)


Application.Run(form)