#!/bin/bash
set -e

# Get parameters
USES="$1"
WITH="$2"

# Create temporary directory outside the repository
TEMP_DIR="../.tmp-dynamic-uses"
mkdir -p "$TEMP_DIR"
chmod 700 "$TEMP_DIR"

# Validate inputs
if [[ -z "$USES" ]]; then
  echo "::error::The 'uses' input must not be empty"
  exit 1
fi

# Create dynamic action file
cat > "$TEMP_DIR/action.yml" << EOF
outputs:
  outputs:
    value: \${{ toJSON(steps.target_action.outputs) }}
runs:
  using: composite
  steps:
  - id: target_action
    uses: $USES
    with: $WITH
EOF

# Output the temporary directory path
echo "temp_dir=$TEMP_DIR" >> $GITHUB_OUTPUT
echo "::debug::Dynamic action created successfully in $TEMP_DIR"
