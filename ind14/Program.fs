open System
open System.Windows.Forms
open System.Drawing
open System.Text.RegularExpressions


let form = new Form()
let label2 = new Label()
let label3 = new Label()
let textBox2 = new TextBox()
let richTextBox1 = new RichTextBox()
let button1 = new Button()
form.SuspendLayout()
           // 
           // label2
           // 
label2.AutoSize <- true

label2.Location <- new Point(112, 120)
label2.Name <- "label2"
label2.Size <- new Size(72, 19)
label2.TabIndex <- 2
label2.Text <- "Введите текст"
           // 
           // label3
           // 
label3.AutoSize <- true

label3.Location <- new Point(100, 79)
label3.Name <- "label3"
label3.Size <- new Size(116, 19)
label3.TabIndex <- 3
label3.Text <- "Результат"
           // 
           // textBox2
           // 

textBox2.Location <- new Point(172, 79)
textBox2.Name <- "textBox2"
textBox2.Size <- new Size(294, 26)
textBox2.TabIndex <- 4
textBox2.Text <- ""
           // 
           // richTextBox1
           // 
richTextBox1.Location <- new Point(203, 120)
richTextBox1.Name <- "richTextBox1"
richTextBox1.Size <- new Size(234, 174)
richTextBox1.TabIndex <- 5
richTextBox1.Text <- ""
           

button1.Location <- new Point(172, 346)
button1.Name <- "button1"
button1.Size <- new Size(294, 43)
button1.TabIndex <- 6
button1.Text <- "Решить задачу!"
button1.UseVisualStyleBackColor <- true
          


form.AutoScaleMode <- AutoScaleMode.Font
form.ClientSize <- new Size(560, 439)
form.Controls.Add(button1)
form.Controls.Add(richTextBox1)
form.Controls.Add(textBox2)
form.Controls.Add(label3)
form.Controls.Add(label2)
form.Name <- "Form1"
form.Text <- "Form1"
form.ResumeLayout(false)
form.PerformLayout()

button1.Click.Add(fun evArgs -> 
   textBox2.Clear()
   let str = richTextBox1.Text.Split(' ')
   let list = [for i in str -> (Regex.Matches(i,@"[уеыаоэяиёю]",RegexOptions.IgnoreCase).Count,i)]
   let list1 = List.sort(list)
   let word = List.last list1
   match word with
    |(a,b) -> textBox2.AppendText(b) |>ignore)


Application.Run(form)
