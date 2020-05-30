open System
open System.Windows.Forms
open System.Drawing

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
label2.Text <- "Результат"
           // 
           // label3
           // 
label3.AutoSize <- true

label3.Location <- new Point(29, 79)
label3.Name <- "label3"
label3.Size <- new Size(116, 19)
label3.TabIndex <- 3
label3.Text <- "Введите список"
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



let sumpred list el = 
    let rec sumpred_t list el sum = 
         match list with
         | [] -> 0
         | h::tail -> if(h=el) then sum
                      else sumpred_t tail el (sum+h)
    sumpred_t list el 0


let mulpred index list el =
    let rec mulpred_t ind el mul = function
        [] -> true
        | h::tail -> if(h = el && ind =index) then true
                     else if (el % h =0) then mulpred_t (ind + 1) el (mul*h) tail
                                            else false
    mulpred_t 0 el 1 list                  

let countbigger list el =
        let rec countbigger_t list  el count =
             match list with
             | [] -> count
             | h::t -> if (el<h) then countbigger_t t el (count + 1)
                       else countbigger_t t el count
        countbigger_t list el 0

let solve list1 s =  
    let res = List.choose(fun x ->
      match x with
        | (a,b) when (b>sumpred list1 b) && (List.exists(fun p->p*p =b) list1) && (mulpred a list1 b ) -> Some(b,sumpred list1 b,countbigger list1 b)
        |_->None) s
    res



button1.Click.Add(fun evArgs -> 
    richTextBox1.Clear()
    let str = textBox2.Text.Split(' ')
    let list1 = [for i in str->System.Convert.ToInt32(i)]
    let s = List.indexed(list1)    
    let result = solve list1 s
    List.iter(fun x -> richTextBox1.AppendText(x.ToString() + "\n")) result |> ignore
    )



Application.Run(form)

//****************************************//
//****************************************//
//****************************************//




