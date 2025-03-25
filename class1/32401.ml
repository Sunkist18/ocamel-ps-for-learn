let is_similar_ana s =
  let len = String.length s in
  let valid_length = len >= 3 in
  let valid_ends = s.[0] = 'A' && s.[len - 1] = 'A' in
  let valid_check = valid_length && valid_ends in
  
  let rec count_chars i a_count n_count =
    match i with
    | i when i = len -> a_count = 2 && n_count = 1
    | _ -> 
        let new_a_count = if s.[i] = 'A' then a_count + 1 else a_count in
        let new_n_count = if s.[i] = 'N' then n_count + 1 else n_count in
        count_chars (i + 1) new_a_count new_n_count
  in
  
  valid_check && count_chars 0 0 0

let count_similar_ana s =
  let len = String.length s in
  
  let rec check_substrings start_idx end_idx count =
    match start_idx, end_idx with
    | start_idx, _ when start_idx > len - 3 -> count  
    | start_idx, end_idx when end_idx > len - 1 -> check_substrings (start_idx + 1) (start_idx + 2) count
    | start_idx, end_idx ->
        let substring = String.sub s start_idx (end_idx - start_idx + 1) in
        let new_count = if is_similar_ana substring then count + 1 else count in
        check_substrings start_idx (end_idx + 1) new_count
  in
  check_substrings 0 2 0

let () =
  let n = read_int () in
  let s = read_line () in
  let result = count_similar_ana s in
  Printf.printf "%d\n" result
