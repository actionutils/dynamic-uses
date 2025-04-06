# actionutils/dynamic-uses

A GitHub Action to dynamically resolve and use another GitHub action. This provides a workaround for [GitHub Actions Runner limitation](https://github.com/actions/runner/issues/895) where you cannot use dynamic values in the `uses` field.

## Usage

TODO: More detailed examples and use cases will be added soon.

```yaml
jobs:
  example:
    runs-on: ubuntu-latest
    steps:
      - uses: actionutils/dynamic-uses@v1
        id: dynamic
        with:
          uses: actions/setup-node@v3
          with: '{"node-version": "18"}'

      # Access outputs from the dynamic action
      - run: echo "Node version is ${{ fromJSON(steps.dynamic.outputs.outputs).node-version }}"
```

## Inputs

| Name | Description | Required | Default |
|------|-------------|----------|---------|
| `uses` | Action reference or path, e.g. `actions/setup-node@v3` | Yes | |
| `with` | JSON-ified `inputs` for the action, e.g. `{"node-version": "18"}` | No | `{}` |

## Outputs

| Name | Description |
|------|-------------|
| `outputs` | JSON-ified `outputs` from the action, e.g. `{"node-version": "v18.12.0", "cache-hit": true}` |

## How it works

TODO: Detailed explanation will be added.

## License

MIT License. This project is a fork of [jonjenkins/dynamic-uses](https://github.com/jonjenkins/dynamic-uses) (ISC License) with some improvements and modifications to maintain dedicated release workflow and versioning control.

