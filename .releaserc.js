const compareFunc = require('compare-func')

module.exports = {
  branches: ["main"],
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
          { type: "build", hidden: true },
          { type: "chore", scope: "deps", section: "📌 Dependencies" },
          { type: "chore", scope: "other", hidden: true },
          { type: "ci", hidden: true },
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
        set -e

        for galaxy_file in $(find . -type f -name galaxy.yml -print); do
          echo "Updating $galaxy_file...";
          sed -i 's/^version:.*/version: \${nextRelease.version}/g' $galaxy_file;
          sed -E -i 's|^  (homelab_ops..*): \">=(.*)\"|  \\1: \">=\${nextRelease.version}\"|g' $galaxy_file;
        done;
        echo "Galaxy files updated.";
        echo;
        for req_file in $(find . -type f -name requirements.yaml); do
          echo "Updating $req_file if needed...";
          temp=$(mktemp);
          cat $req_file | tr '\n' '!' > $temp;
          if grep -q -E '\- name: (homelab_ops\..*)\!  version: (.*)\!' $temp; then
            sed -E -i -n 's|\- name: (homelab_ops\..*)\!  version: (.*)\!|\- name: \\1\n  version: \${nextRelease.version}\n|p' $temp;
            cat $temp | tr '\!' '\n' > $req_file;
            echo "... updated." | pr -t -o 4;
          else
            echo "... update not neccessary." | pr -t -o 4;
          fi
          rm $temp;
        done;
        echo "Requirement files updated.";
        echo "Outputing new release version...";
        echo \${nextRelease.version} > /tmp/released.version;
        echo "Prepare complete.";
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
