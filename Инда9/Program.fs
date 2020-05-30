let fact (n:bigint) =
    let rec fact_t (n:bigint) (a:bigint) =
        if (n = 1I || n=0I) then a
        else fact_t (n-1I) (a*n)
    fact_t n 1I

let split (n:bigint) =
    let rec split_t (n:bigint) (sum:bigint) =
        if(n=0I) then sum
        else split_t (n/10I) (sum+fact (n % 10I))
    split_t n 0I

let check (n:bigint) =
    if(n=split n) then true
    else false

let ind9 (n:bigint) =
    let rec solution (n:bigint) (sum:bigint) =
         if(n = 2I) then sum
         else if(check n) then  printf "%A  " n 
                                solution (n-1I) (sum+n)
              else solution (n-1I) sum
    solution n 0I


[<EntryPoint>]
let main argv =
    let Ans =ind9 100000I
    printf "\n%A" Ans
    let z = System.Console.ReadKey()
    0 
