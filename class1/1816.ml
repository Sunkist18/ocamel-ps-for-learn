open Int64

let is_valid_key s =
  (* 에라스토테네스의 채를 활용하고 싶지만, 아직 배열에 대한 공부가 부족하고 *)
  (* 문제해결에 필요한 N값은 아니라고 판단해서 브루트포스를 활용하였다 *)
  let max_n = of_int 1000000 in
  
  let rec check s d =
    match (s, d) with
    | (s, _) when s = one -> true
    | (_, d) when compare d max_n > 0 -> true
    | (s, d) when compare (mul d d) s > 0 -> compare s max_n > 0
    | (s, d) when rem s d = zero -> if compare d max_n <= 0 then false else check (div s d) d
    | (s, d) -> check s (add d one)
  in
  
  check s (of_int 2)

let () =
  let n = read_int () in
  for _ = 1 to n do
    let s = read_line () |> of_string in
    let answer = 
      match is_valid_key s with
      | true -> "YES"
      | false -> "NO"
    in
    print_endline answer
  done
