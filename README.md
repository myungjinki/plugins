# plugins

Claude Code와 Codex에서 쓰는 공개 플러그인 저장소.

## 플러그인

| 플러그인 | 하는 일 | 부르는 법 |
| --- | --- | --- |
| `codyssey-final-check` | 코디세이 AI 네이티브 파이널 프로젝트 저장소를 평가기준표에 맞춰 자가 점검한다 | Claude `/codyssey-final-check:evaluate 중간`, Codex `$evaluate 중간` |

## 설치

Claude Code:

```bash
claude plugin marketplace add myungjinki/plugins
```

```bash
claude plugin install codyssey-final-check@plugins
```

Codex:

```bash
codex plugin marketplace add myungjinki/plugins
```

```bash
codex plugin add codyssey-final-check@plugins
```

## codyssey-final-check

점검할 프로젝트 저장소에서 부른다. 저장소 파일은 고치지 않는다.

| 난이도 | 하는 일 | 상태 |
| --- | --- | --- |
| `쉬움` | 저장소에서 필수요건 G1~G7을 점검한다 | 사용 가능 |
| `중간` | 쉬움에 더해 6개 영역 100점을 채점하고 점수를 올릴 일을 알려 준다 | 사용 가능 |
| `서비스 검증` | 배포된 서비스에 접속해 기준표대로 시험한다 | 준비 중 |

### 알아 둘 점

- 결과는 자가 점검이며 공식 평가 결과가 아니다.
- 서비스를 실행하지 않으므로 G2 접속·구동, G4 동작, G7 화면 표기는 팀이 직접 확인해야 한다.
- 영역 2·3의 탁월 조건은 서비스를 시험해야 하므로 우수까지만 준다.
- 저장소에 API 키가 있으면 파일 위치만 알려 주고 키 값은 출력하지 않는다.

## 검증

```bash
claude plugin validate .
```
