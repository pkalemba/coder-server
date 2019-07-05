#!/bin/bash
if [[ -v GIST_TOKEN ]] && [[ -v GIST_ID ]]; then
    cat <<EOF > /home/coder/.local/share/code-server/User/syncLocalSettings.json
    {
        "ignoreUploadFiles": [
            "state.*",
            "syncLocalSettings.json",
            ".DS_Store",
            "sync.lock",
            "projects.json",
            "projects_cache_vscode.json",
            "projects_cache_git.json",
            "projects_cache_svn.json",
            "gpm_projects.json",
            "gpm-recentItems.json"
        ],
        "ignoreUploadFolders": [
            "workspaceStorage"
        ],
        "ignoreExtensions": [],
        "gistDescription": "Visual Studio Code Settings Sync Gist",
        "version": 329,
        "token": "$GIST_TOKEN",
        "downloadPublicGist": true,
        "supportedFileExtensions": [
            "json",
            "code-snippets"
        ],
        "openTokenLink": true,
        "disableUpdateMessage": false,
        "lastUpload": null,
        "lastDownload": null,
        "githubEnterpriseUrl": null,
        "askGistName": false,
        "customFiles": {},
        "hostName": null
    }
EOF
    cat <<EOF > /home/coder/.local/share/code-server/User/settings.json
    {
        "sync.autoDownload": true,
        "sync.gist": "$GIST_ID"
    }
EOF
fi

code-server --disable-telemetry $PWD $@



