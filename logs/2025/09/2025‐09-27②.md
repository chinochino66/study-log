## 1) データベースの種類（RDBMS）

SQLは「言語」であって、**実際にSQLを動かすソフトウェア（エンジン）」は複数ある**。代表的なのがこれ：

* **PostgreSQL（ポスグレ）**

  * 無料のオープンソース
  * 標準SQLへの準拠度が高く、拡張機能も豊富
  * 分析・研究用途や大規模システムで人気
  * AWS（Amazon RDS, Aurora PostgreSQL互換など）でもよく使われる

* **MySQL（マイエスキューエル）**

  * 無料のオープンソース（ただしOracleが管理）
  * Webアプリ（WordPressなど）で超定番
  * **SQLite**はMySQLに似た軽量版で、アプリ内蔵や学習で使いやすい

* **SQL Server（エスキューエルサーバー）**

  * Microsoft製
  * Windows企業システムや大企業向け業務システムでよく使われる
  * GUIツール（SSMS）が強力

---

## 2)  違いの具体例

| 機能/挙動   | PostgreSQL                  | MySQL / SQLite      | SQL Server                  |
| ------- | --------------------------- | ------------------- | --------------------------- |
| LIMIT句  | `LIMIT 10`                  | `LIMIT 10`          | `TOP 10` または `OFFSET…FETCH` |
| NULLの扱い | `NULL` = 最大（ASCで最後）         | `NULL` = 最小（ASCで先頭） | `NULL` = 最小（ASCで先頭）         |
| 専用句     | `NULLS LAST`/`FIRST` あり     | なし（工夫して制御）          | なし（工夫して制御）                  |
| 拡張      | JSON型・CTE・再帰SQL・Window関数が豊富 | JSONサポート弱め、軽量       | 再帰SQLやWindow関数あり、MS独自構文も    |

---

## 4) 実務での位置づけ

* **学習 / 軽量Webアプリ** → SQLite
* **スタートアップ・Webサービス** → MySQL（手軽でサポート多い）
* **大規模分析 / 標準SQL厳守** → PostgreSQL
* **企業内システム（特にWindows系）** → SQL Server
