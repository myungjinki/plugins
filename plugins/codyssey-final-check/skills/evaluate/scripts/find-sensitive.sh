#!/usr/bin/env bash
# 민감 정보가 있는 파일 위치만 출력한다. 값은 출력하지 않는다.
set -u

key_file='(^|/)(\.env(\..*)?|.*\.pem|.*\.key|credentials.*|secrets?\..*)$'
example_file='\.(example|sample|template)$'
key_value='(^|[^A-Za-z0-9_-])(sk-[A-Za-z0-9_-]{20,}|AIza[0-9A-Za-z_-]{35}|gh[pousr]_[A-Za-z0-9]{36}|AKIA[0-9A-Z]{16}|xox[baprs]-[A-Za-z0-9-]{10,})'
phone='(^|[^0-9A-Za-z])01[016789][- ]?[0-9]{3,4}[- ]?[0-9]{4}([^0-9A-Za-z]|$)'

git_q() {
  git -c core.quotePath=false "$@"
}

# --masked <파일>: 키 값을 가리고 파일 내용을 출력한다.
if [ "${1:-}" = '--masked' ]; then
  sed -E "s/$key_value/\1[가림]/g" "$2"
  exit
fi

echo '== 키 파일 =='
git_q ls-files | grep -E "$key_file" | grep -vE "$example_file"

echo '== 키 형식 =='
git_q grep -lIE "$key_value"

echo '== Git 이력 =='
{
  git_q log --all --diff-filter=A --name-only --format= | grep -E "$key_file" | grep -vE "$example_file"
  git_q log --all -G"$key_value" --name-only --format=
} | grep -v '^$' | sort -u

echo '== 전화번호 형식 =='
git_q grep -lIE "$phone"

exit 0
