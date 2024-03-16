const { maxLineLength } = require('@commitlint/ensure')

const bodyMaxLineLength = 120

const validateBodyMaxLength = (parsedCommit) => {
  const { type, scope, body } = parsedCommit
  const isDepsCommit = type === 'chore' && scope === 'deps'

  return [
    isDepsCommit || !body || maxLineLength(body, bodyMaxLineLength),
    `commit message body line length must not exceed ${bodyMaxLineLength}`,
  ]
}

module.exports = {
  extends: ['@commitlint/config-conventional'],
  plugins: ['commitlint-plugin-function-rules'],
  rules: {
    // increase max line length for header
    'header-max-length': [2, 'always', 120],

    // disable max line length for footers
    'footer-max-line-length': [0, 'always'],

    // disable default 'body-max-line-length' rule and add custom rule for body-max-line-length
    'body-max-line-length': [0],
    'function-rules/body-max-line-length': [
      2,
      'always',
      validateBodyMaxLength
    ],

    // specify the allowed scopes
    'scope-enum': [2, 'always',
      [
        'archive',
        'block_device',
        'configure',
        'k3s',
        'os',
        'packages',
        'raspberry_pi',
        'deps',
        'release',
        'other'
      ]
    ],
    'scope-empty': [2, 'never'],

    // don't validate case of body
    'body-case': [0, 'always']
  }
}
