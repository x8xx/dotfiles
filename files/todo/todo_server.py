# http serverを作成
# http://localhost:8080/ にアクセスすると、todo.htmlが表示される

from http.server import HTTPServer, SimpleHTTPRequestHandler
import os
import sys


def parse_todo():
    todo_file_path = os.getenv('TODO_FILE_PATH', '.todo')
    
    try:
        with open(todo_file_path, 'r') as f:
            todo_file_lines = f.readlines()
    except FileNotFoundError:
        print(f"エラー: TODOファイル '{todo_file_path}' が見つかりません。")
        print("環境変数 TODO_FILE_PATH でファイルパスを指定してください。")
        sys.exit(1)
    except Exception as e:
        print(f"エラー: TODOファイルの読み込みに失敗しました: {e}")
        sys.exit(1)

    todo_result = {}
    date = ''
    for line in todo_file_lines:
        if line.startswith('>>>> '):
            date = line.replace('>>>>', '').strip()
            todo_result[date] = []
        elif line.startswith('- (x) '):
            todo_result[date].append({'title': line.replace('- (x) ', '❌ ').strip(), 'body': ''})
        elif line.startswith('- (/) '):
            todo_result[date].append({'title': line.replace('- (/) ', '✅ ').strip(), 'body': ''})
        else:
            if len(todo_result[date]) > 0:
                todo_result[date][len(todo_result[date]) - 1]['body'] += line


    # 空のtodoリストを持つ日付エントリを除外
    todo_result = {date: todos for date, todos in todo_result.items() if todos}
    
    return todo_result


class MyHandler(SimpleHTTPRequestHandler):
    def do_GET(self):
        if self.path == '/':
            self.send_response(200)
            self.send_header('Content-Type', 'text/html; charset=utf-8')
            self.end_headers()

            # TODOリストを表示
            html = '<html><head><title>Todo List</title></head><body>'
            html += '<button id="filterBtn" onclick="toggleFilter()" style="margin: 10px; padding: 8px 16px; background-color: #007bff; color: white; border: none; border-radius: 4px; cursor: pointer;">未完了のみ表示</button>'
            todos = parse_todo()
            for date, todo_list in todos.items():
                html += f'<div class="date-section">'
                html += f'<h2>{date}</h2>'
                html += '<ul>'
                for todo in todo_list:
                    css_class = 'todo-incomplete' if '❌' in todo["title"] else 'todo-complete'
                    html += f'<li class="{css_class}">{todo["title"]}</li>'
                    html += f'<div class="{css_class}">'+todo["body"].replace("\n", "<br>")+'</div>'
                html += '</ul>'
                html += '</div>'
            html += '</body>'

            # 10秒ごとにリロードする
            # html += '<script>setTimeout(function(){location.reload()}, 10000);</script>'

            html += '''
<script>
let showingIncompleteOnly = false;

function sortDateSections(ascending = true) {
    const container = document.body;
    const dateSections = Array.from(document.querySelectorAll('.date-section'));
    const button = document.getElementById('filterBtn');
    
    // 日付セクションをソート
    dateSections.sort((a, b) => {
        const dateA = a.querySelector('h2').textContent.trim();
        const dateB = b.querySelector('h2').textContent.trim();
        
        if (ascending) {
            return dateA.localeCompare(dateB);
        } else {
            return dateB.localeCompare(dateA);
        }
    });
    
    // ソート順でDOM要素を再配置
    dateSections.forEach(section => {
        container.insertBefore(section, button.nextSibling);
    });
}

function toggleFilter() {
    const btn = document.getElementById('filterBtn');
    const completeItems = document.querySelectorAll('.todo-complete');
    const dateSections = document.querySelectorAll('.date-section');
    
    if (showingIncompleteOnly) {
        // すべて表示
        completeItems.forEach(item => {
            item.style.display = '';
        });
        dateSections.forEach(section => {
            section.style.display = '';
        });
        btn.textContent = '未完了のみ表示';
        showingIncompleteOnly = false;
        
        // 昇順ソート（デフォルト）
        sortDateSections(true);
    } else {
        // 未完了のみ表示
        completeItems.forEach(item => {
            item.style.display = 'none';
        });
        
        // 各日付セクションをチェックして、未完了todoがない場合は非表示
        dateSections.forEach(section => {
            const incompleteItems = section.querySelectorAll('.todo-incomplete');
            if (incompleteItems.length === 0) {
                section.style.display = 'none';
            }
        });
        
        btn.textContent = 'すべて表示';
        showingIncompleteOnly = true;
        
        // 降順ソート
        sortDateSections(false);
    }
}
</script>
</html>'''

            self.wfile.write(html.encode())

        return SimpleHTTPRequestHandler.do_GET(self)

    def list_directory(self, path):
        return None


def main():
    # 環境変数の説明を表示
    todo_file_path = os.getenv('TODO_FILE_PATH', '.todo')
    print("=" * 50)
    print("TODO Server 起動中...")
    print("=" * 50)
    print(f"使用中のTODOファイル: {todo_file_path}")
    print()
    print("環境変数の設定方法:")
    print("  export TODO_FILE_PATH=/path/to/your/todo.txt")
    print("  python todo_server.py")
    print()
    print("サーバーアクセス URL: http://localhost:8080/")
    print("=" * 50)
    print()
    
    # TODOファイルの存在確認（parse_todo内でエラーハンドリングされる）
    try:
        parse_todo()
        print(f"✅ TODOファイルの読み込みが正常に完了しました")
    except SystemExit:
        return
    
    print("🚀 サーバーを起動しています...")
    print("終了するには Ctrl+C を押してください")
    print()
    
    try:
        httpd = HTTPServer(('localhost', 8080), MyHandler)
        httpd.serve_forever()
    except KeyboardInterrupt:
        print("\n👋 サーバーを停止しています...")
        httpd.shutdown()

if __name__ == "__main__":
    main()
