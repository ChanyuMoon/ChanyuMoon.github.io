hugo_post() {
  local title="$*"

  # ── 1) slug 만들기 ───────────────────────────────────────────
  local slug
  slug=$(echo "$title" | iconv -c -t ascii//TRANSLIT | tr '[:upper:]' '[:lower:]' \
          | tr -cd 'a-z0-9 -' | tr ' ' '-' | tr -s '-')

  # ── 2) 타임스탬프 & 저장 경로 정의 ───────────────────────────────────────
  local ts_file ts_iso
  ts_file=$(date +"%Y%m%d-%H%M%S")
  ts_iso=$(date +"%Y-%m-%dT%H:%M:%S%z")
  local dir="content/blogs/${ts_file}_${slug}"

  # ── 3) 이미 존재하면 경고하고 종료 ──────────────────────────
  if [[ -d $dir ]]; then
    echo "Post already exists: $dir  →  aborted."
    return 1            # 함수일 때; 스크립트라면 `exit 1`
  else
    mkdir -p "$dir"
  fi

  # ── 4) 스켈레톤 작성 ───────────────────────────
  cat > "$dir/index.md" <<EOF # index.md 로 이름을 해야, 상위 폴더의 _index.md 가 포스트를 인지함.
---
title: "$title"
date: $ts_iso
draft: true
author: "Chanyu Moon"
tags: []
image: ""
discription: ""
toc: true
---
<!-- Write here -->
EOF

  # ── 5) 에디터 열기 ──────────────────────────────────────────
  ${EDITOR:-code} "$dir/index.md"
}
