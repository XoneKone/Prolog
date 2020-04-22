open System

let rec zep (number:uint32) (count:uint32) : uint32 =
    if (number=1u) then count
    else if (number%2u=0u) then zep (number/2u) (count+1u)
    else zep (number*3u + 1u) (count+1u)


let rec max_zep  (a:uint32) (maxNum:uint32) (maxCount:uint32) :uint32=
    let z = zep a 1u
    if(a=1000000u) then maxNum
    else if(z>maxCount) then max_zep (a+1u) a z
    else max_zep(a+1u) maxNum maxCount

let p6 =
    max_zep 1u 1u 1u

[<EntryPoint>]
let main argv =
    let Ans = p6
    System.Console.WriteLine(Ans)
    let z = System.Console.ReadKey()
    printfn "%A" argv
    0
