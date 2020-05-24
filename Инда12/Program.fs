let rec read_list n = 
    if n=0 then []
    else
    let Head = System.Convert.ToInt32(System.Console.ReadLine())
    let Tail = read_list (n-1)
    Head::Tail

let read_data = 
    printf "Введите кол-во элементов в списке: "
    let n=System.Convert.ToInt32(System.Console.ReadLine())
    printf "Введите элементы:\n"
    read_list n

let solve list = 
    let rec solve_t sum count = function
        [] -> count
        |head::tail -> if(head > sum) then solve_t (sum + head) (count + 1) tail
                                      else solve_t (sum+head) count tail
    solve_t 0 0 list
    

[<EntryPoint>]
let main argv =
   
    let list = read_data
    let Ans = solve list
    printfn "%A" list
    printfn "\nКол-во элементов, которые больше, чем сумма всех предыдущих = %A" Ans
    let z = System.Console.ReadKey()
    0 
