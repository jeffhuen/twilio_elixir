#!/bin/bash
set -euo pipefail

REPO="twilio/twilio-oai"
OUTPUT_DIR="priv/openapi"
VERSION_FILE="OPENAPI_VERSION"

mkdir -p "$OUTPUT_DIR"

# Get latest release tag
LATEST_TAG=$(curl -sL "https://api.github.com/repos/${REPO}/releases/latest" | grep '"tag_name"' | head -1 | cut -d'"' -f4)

echo "Latest twilio-oai release: $LATEST_TAG"

# Download tarball and extract JSON specs
TARBALL_URL="https://api.github.com/repos/${REPO}/tarball/${LATEST_TAG}"
TMP_DIR=$(mktemp -d)

curl -sL "$TARBALL_URL" | tar xz -C "$TMP_DIR" --strip-components=1

# Copy JSON specs
cp "$TMP_DIR/spec/json"/twilio_*.json "$OUTPUT_DIR/"

# Cleanup
rm -rf "$TMP_DIR"

# Track version
echo "$LATEST_TAG" > "$VERSION_FILE"

SPEC_COUNT=$(ls "$OUTPUT_DIR"/twilio_*.json | wc -l | tr -d ' ')
echo "Downloaded $SPEC_COUNT spec files"
echo "Spec version: $LATEST_TAG"
echo "Specs saved to: $OUTPUT_DIR/"
