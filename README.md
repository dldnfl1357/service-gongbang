# 서비스공방

마이크로 SaaS를 빠르게 만들기 위한 Agent Skills 모음입니다. 아이디어 발굴, 유료 V0 스펙, 구현 루프, 런치 문구를 Claude Code, Codex, Gemini CLI에서 바로 실행합니다.

## 설치

Claude, Gemini, Codex에게 이렇게 말해도 됩니다:

```text
서비스공방 설치해줘: https://github.com/dldnfl1357/service-gongbang
```

```bash
curl -fsSL https://raw.githubusercontent.com/dldnfl1357/service-gongbang/main/install.sh | bash
```

도구별 설치:

```bash
curl -fsSL https://raw.githubusercontent.com/dldnfl1357/service-gongbang/main/install.sh | bash -s -- codex
```

지원 대상:

- CLI: `~/.local/bin/gongbang`
- Claude Code: `~/.claude/skills/`
- Codex: `${CODEX_HOME:-~/.codex}/skills/`
- Gemini CLI: `~/.gemini/extensions/service-gongbang`

## 곁질문

```bash
gongbang run codex
gongbang side "방금 말한 trust boundary가 뭐야?"
```

`run`은 메인 AI 세션을 그대로 실행하면서 로그를 남깁니다. 작업 중 다른 터미널에서 `side`를 실행하면 최신 로그를 읽고 별도 답변만 합니다.

## 스킬

| Skill | 하는 일 |
| --- | --- |
| `micro-founder-loop` | 전체 흐름 실행 |
| `micro-market-signal` | 시장 신호와 아이디어 후보 찾기 |
| `micro-offer-spec` | 유료 V0 스펙으로 자르기 |
| `micro-build-loop` | 구현 티켓과 검증 루프 만들기 |
| `micro-launch-pack` | 런치 카피 만들기 |

## 첫 실행

```text
Use micro-founder-loop. 한국 인디해커를 위한 마이크로 SaaS를 만들고 싶은데, 첫 웨지는 아직 모르겠어.
```

첫 질문은 반드시 세 가지로 좁힙니다: 누가 살지, 어디를 볼지, 무엇을 피할지.

## 라이선스

MIT.
