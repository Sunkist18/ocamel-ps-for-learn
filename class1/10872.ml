let solve n =
  let rec fac ret i =
    match i with
    | 0 -> ret
    | _ -> fac (ret * i) (i - 1)
  in
  
  match n with
  | 0 | 1 -> 1
  | i -> fac 1 i

let () =
  let n = read_int () in
  Printf.printf "%d\n" (solve n)