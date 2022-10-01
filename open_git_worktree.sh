mkdir -p ../.devcontainer_node
git --work-tree="../.devcontainer_node" --git-dir=./.git checkout -f workspace_node
mkdir -p ../.devcontainer_java
git --work-tree="../.devcontainer_java" --git-dir=./.git checkout -f workspace_java
