let rec solve n i =
  match i with
  | 10 -> ()
  | _ -> 
      Printf.printf "%d * %d = %d\n" n i (n * i);
      solve n (i + 1)

let () = 
  let n = read_int () in
  solve n 1 