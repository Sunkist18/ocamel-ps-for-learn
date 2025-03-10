(* 설탕 봉지 문제: 5kg와 3kg 봉지로 정확히 N kg을 만들 수 있는 최소 봉지 수 계산 *)
let min_bags n =
  (* 3kg 미만은 만들 수 없으므로 바로 -1 반환 *)
  let rec try_combination five_count =
    let remaining = n - (five_count * 5) in

    if remaining < 0 then -1  (* 불가능한 경우 *)
    else if remaining mod 3 = 0 then
      five_count + (remaining / 3)  (* 유효한 조합 발견 *)
    else if five_count > 0 then
      try_combination (five_count - 1)  (* 5kg 봉지 하나 줄이고 다시 시도 *)
    else
      -1
  in
  try_combination (n / 5)  (* 최대 가능한 5kg 봉지 수부터 시작 *)

let () = 
  let n = read_int() in
  Printf.printf "%d\n" (min_bags n)
