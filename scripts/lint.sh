#!/bin/bash -x

cd "$(dirname "${BASH_SOURCE[0]}")"
cd ../game

FORMAT_ISSUES=$(flutter format --set-exit-if-changed -n .)
if [ $? -eq 1 ]; then
  echo "flutter format issues on"
  echo $FORMAT_ISSUES
  exit 1
fi

flutter pub get

ANALYZE_ISSUES=$(flutter analyze .)
if ! echo "$result" | grep -q "No issues found!"; then
  echo "flutter analyze issue: $1"
  echo "$ANALYZE_ISSUES"
  exit 1
fi

echo "success"
exit 0
