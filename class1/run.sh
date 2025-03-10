#!/bin/bash

# 문제 번호를 인자로 받습니다
problem_number=$1

if [ -z "$problem_number" ]; then
    echo "사용법: ./run.sh <문제번호>"
    echo "예시: ./run.sh 1000"
    exit 1
fi

# 문제 파일 확인
problem_file="${problem_number}.ml"

if [ ! -f "$problem_file" ]; then
    echo "에러: $problem_file 파일이 존재하지 않습니다."
    exit 1
fi

echo "컴파일 및 실행 중: $problem_file"

# 문제 파일을 Main.ml로 복사 (채점 서버 환경과 동일하게)
echo "문제 파일을 Main.ml로 복사 중..."
cp "$problem_file" Main.ml

# ocamlopt를 사용하여 컴파일 (채점 서버 방식과 동일)
echo "ocamlopt로 컴파일 중... (채점 서버 방식)"
ocamlopt -o Main Main.ml -O2

# 실행
echo "실행 중..."
./Main

# 임시 파일 정리
echo "정리 중..."
rm -f Main Main.cm* Main.o Main.ml