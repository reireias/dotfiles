# Dotfiles Repository Improvement TODO

リポジトリ解析結果に基づく改善タスクリスト

## 🟡 中優先度

### ドキュメント強化

- [ ] CHANGELOG.mdの作成
  - [ ] 過去の主要変更を記録
  - [ ] 今後の変更履歴管理ルールを確立

- [ ] CONTRIBUTING.mdの作成
  - [ ] コントリビューションガイドライン
  - [ ] コードスタイル規約
  - [ ] プルリクエストのプロセス

- [ ] TROUBLESHOOTING.mdの作成
  - [ ] よくある問題と解決策
  - [ ] OS別のトラブルシューティング
  - [ ] デバッグ方法

- [ ] 各Ansibleロールへの個別READMEの追加
  - [ ] `ansible/roles/dotfiles/README.md`
  - [ ] `ansible/roles/homebrew/README.md`
  - [ ] `ansible/roles/development/README.md`
  - [ ] `ansible/roles/zsh/README.md`
  - [ ] `ansible/roles/neovim/README.md`
  - [ ] `ansible/roles/rust/README.md`
  - [ ] `ansible/roles/tools/README.md`

- [ ] README.mdの拡充
  - [ ] プラグイン選定の理由を説明
  - [ ] アーキテクチャ設計の意図を記載
  - [ ] 設定オプションのリファレンス追加

### 機能追加

- [ ] バックアップ/リカバリー機能の実装
  - [ ] バックアップ戦略のドキュメント化
  - [ ] ロールバック手順の作成
  - [ ] 設定エクスポート/アーカイブスクリプトの追加

- [ ] OS対応の拡張
  - [ ] Fedoraサポートの検討
  - [ ] Arch Linuxサポートの検討
  - [ ] OS別トラブルシューティング情報の追加

- [ ] テスト範囲の拡大
  - [ ] シェル関数の単体テストの追加
  - [ ] 冪等性テストの実装
  - [ ] 複数Linux distroでのDockerテスト

## 🟢 低優先度

### コード品質

- [ ] Shellcheckの警告対応
  - [ ] 不要な`shellcheck disable`コメントの削除
  - [ ] 警告の根本的な修正

- [ ] エラーハンドリングの強化
  - [ ] 各Ansibleロールのエラーハンドリング改善
  - [ ] スクリプトの異常系処理追加

- [ ] パラメータ化の推進
  - [ ] ハードコード値の変数化
  - [ ] 設定の柔軟性向上

### 便利機能

- [ ] `.scripts/`ディレクトリの活用
  - [ ] バックアップスクリプトの追加
  - [ ] 依存関係更新スクリプトの追加
  - [ ] セットアップ支援スクリプトの追加
  - [ ] 設定検証スクリプトの追加

- [ ] 依存関係管理の改善
  - [ ] Pythonロックファイルの導入 (poetry, pipenv等)
  - [ ] asdfバージョン管理の堅牢化
  - [ ] 再現性の向上

### 整理整頓

- [ ] 設定ファイルの統一化
  - [ ] YAML, TOML, INI形式の整理
  - [ ] Lint設定の統合検討 (.shellcheckrc, .ansible-lint等)

- [ ] ローカルカスタマイズ機能の拡充
  - [ ] 他の設定ファイルへの`.local`パターン適用
  - [ ] マシン固有のAnsible変数機能の追加

## 📝 メモ

### 現在の強み
- Ansibleベースの優れた自動化
- GitHub Actions CI/CD (複数OS対応)
- モジュール化されたzsh設定
- 最新のNeovim設定 (lazy.nvim)
- 充実したLinting/検証

### 主な懸念点
- .gitignoreの欠如 → セキュリティリスク
- パスのハードコード → 再利用性の低下
- ドキュメント不足 → 新規ユーザーの障壁
- レガシーコード未整理 → メンテナンス負債

---

最終更新: 2025-12-19
