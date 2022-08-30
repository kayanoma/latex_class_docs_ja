# latex_class_docs_ja
VSCodeのdevcontainerを用いたlatex環境(日本語対応)
Ubuntu+latexのイメージを使用

# 必要環境
- Docker
- VSCode + devcontainer(拡張機能)

# 使い方
1. `git clone https://github.com/kayanoma/latex_class_docs_ja.git`
2. VSCodeで開いたら`Reopen in Container`を行う(image作成から行うので初回は半日かかる)
3. class_documents(workspace)内でtexファイル作成 & ファイル右上からbuild可能
4. もしかすると作業終わったらコンテナを`docker rm CONTAINER_ID`で削除した方がいいかも

# 説明
- ./dataはコンテナ内のclass_documents(workspace)と共有されている
- .devcontainer/devcontainer.jsonにlatexのbuild設定が記述されている(latex-workshopの設定とか)
- ./data/.vscode/latex.json.code-snippetsにsnipettsが記述されている