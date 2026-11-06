이 저장소는 Claude Code와 Codex에서 함께 쓰는 공개 플러그인을 만들고 배포한다.

## 구조

- `plugins/<플러그인>/`: 플러그인 하나. `.claude-plugin/plugin.json`, `.codex-plugin/plugin.json`, `skills/`를 둔다.
- `.claude-plugin/marketplace.json`, `.agents/plugins/marketplace.json`: Claude와 Codex의 플러그인 목록.

## 규칙

- 플러그인을 더하면 두 마켓플레이스와 `README.md`의 목록에 함께 적는다.
- 플러그인을 고치면 두 `plugin.json`의 `version`을 같은 값으로 올린다.
- 고친 뒤 `claude plugin validate .`를 실행한다.
- 플러그인을 고칠 때는 그 폴더의 `AGENTS.md`도 따른다.
- 공개 저장소다. 키·토큰·인증 파일과 개인정보를 커밋하지 않는다.
- 커밋 메시지는 영어, 동사 원형으로 시작하고 첫 글자는 대문자, 마침표 없이 50자 안팎. 필요하면 한 줄 띄우고 본문.
