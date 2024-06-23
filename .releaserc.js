const compareFunc = require('compare-func')

module.exports = {
  branches: ["main", "semantic-release"],
  plugins: [

    ["@semantic-release/commit-analyzer", {
      preset: "conventionalcommits",
      releaseRules: [
        { type: "docs", release: "patch" },
        { type: "refactor", release: "patch" },
        { type: "style", release: "patch" },
        { type: "chore", release: "patch" }
      ]
    }],

    ["@semantic-release/release-notes-generator", {
      preset: "conventionalcommits",
      presetConfig: {
        types: [
          { type: "build", section: "⚙️ Other", hidden: true },
          { type: "chore", scope: "deps", section: "📌 Dependencies" },
          { type: "chore", scope: "linters", hidden: true },
          { type: "chore", scope: "other", hidden: true },
          { type: "ci", section: "⚙️ Other", hidden: true },
          { type: "docs", section: "🛠 Improvements" },
          { type: "feat", section: "✨ Features" },
          { type: "fix", section: "🐛 Enhancements + Bug Fixes" },
          { type: "perf", section: "🐛 Enhancements + Bug Fixes" },
          { type: "refactor", section: "🐛 Enhancements + Bug Fixes" },
          { type: "revert", section: "⚙️ Other" },
          { type: "style", section: "🛠 Improvements" },
          { type: "test", section: "🛠 Improvements" }
        ]
      },
      writerOpts: {
        groupBy: "type",
        commitGroupsSort: (a, b) => {
          const alphaA = a.title.replace(/[^a-zA-Z]/gu, "");
          const alphaB = b.title.replace(/[^a-zA-Z]/gu, "");

          const commitGroupOrder = ['Features', 'EnhancementsBugFixes', 'Improvements', 'Other', 'Dependencies'];
          const gRankA = commitGroupOrder.indexOf(alphaA);
          const gRankB = commitGroupOrder.indexOf(alphaB);
          return gRankA - gRankB;
        },
        commitsSort: ['scope', 'subject'],
        noteGroupsSort: 'title',
        notesSort: compareFunc
      }
    }],

    ["@semantic-release/changelog", {
      changelogFile: "CHANGELOG.md",
      changelogTitle: "# Changelog\n\n"
    }],

    ["@semantic-release/exec", {
      prepareCmd: `
        for galaxy_file in $(find . -type f -name galaxy.yml -print); do
          sed -i 's/^version:.*/version: \${nextRelease.version}/g' $galaxy_file;
          sed -E -i 's|^  (homelab_ops..*): \">=(.*)\"|  \\1: \">=\${nextRelease.version}\"|g' $galaxy_file;
        done;
        echo \${nextRelease.version} > /tmp/released.version;"
      `
    }],

    ["@semantic-release/git", {
      assets: ["CHANGELOG.md", "**/galaxy.yml"],
      message: "chore(release): ${nextRelease.version} [skip ci]"
    }],

    "@semantic-release/github"
  ],
  preset: "conventionalcommits"
};
