let is_prime n =
    if n <= 1 then false
    else
        let rec check i =
            if i * i > n then true
            else if n mod i = 0 then false
            else check (i + 1)
        in
        check 2

let _ = 
    (* 첫 번째 입력(N)을 읽고 버립니다 *)
    let _ = read_int() in
    let line = read_line() in

    (* 
     * 입력받은 문자열 line을 공백(' ')을 기준으로 분리하여 문자열 리스트로 만든 후,
     * 각 문자열을 정수로 변환하여 numbers라는 정수 리스트를 생성합니다.
     * - String.split_on_char: 문자열을 특정 문자를 기준으로 분리하는 함수입니다.
     * - List.map: 리스트의 각 요소에 함수를 적용하여 새로운 리스트를 생성합니다.
     * - int_of_string: 문자열을 정수로 변환하는 함수입니다.
     * - |> (파이프 연산자): 왼쪽 값을 오른쪽 함수의 인자로 전달합니다.
     *)
    let numbers = String.split_on_char ' ' line |> List.map int_of_string in

    (* 
     * List.fold_left 함수를 사용하여 numbers 리스트의 모든 요소를 순회하면서 소수의 개수를 계산합니다.
     * - 첫 번째 인자 (fun acc x -> ...): 누산기 함수로, 현재까지의 결과(acc)와 현재 요소(x)를 받아 새로운 결과를 반환합니다.
     * - 두 번째 인자 0: 초기 누산값으로, 소수 개수를 0부터 시작합니다.
     * - 세 번째 인자 numbers: 순회할 리스트입니다.
     * 
     * 누산기 함수 내부에서는:
     * - is_prime 함수를 사용하여 현재 숫자 x가 소수인지 확인합니다.
     * - 소수이면 누산값(acc)에 1을 더하고, 아니면 누산값을 그대로 유지합니다.
     * 
     * 최종적으로 count 변수에는 리스트 내 소수의 총 개수가 저장됩니다.
     *)
    let count = List.fold_left (fun acc x -> if is_prime x then acc + 1 else acc) 0 numbers in

    Printf.printf "%d\n" count