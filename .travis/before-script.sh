#!/usr/bin/env bash
source .travis/utils.sh

if isSignable; then
  if ! openssl aes-256-cbc -K $encrypted_6e3b3dfd66e7_key -iv $encrypted_6e3b3dfd66e7_iv -in .travis/codesigning.asc.enc -out .travis/codesigning.asc -d; then
    echo "Fail extract gpg key"
    exit 1
  fi
  if ! gpg --fast-import .travis/codesigning.asc; then
    echo "Fail import gpg key"
    exit 1
  fi
fi
