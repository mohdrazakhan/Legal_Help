import sqlite3
from flask import Flask, jsonify

# Create the Flask application instance
app = Flask(__name__)

DB_PATH = './indialaw.db'

def get_db_connection():
    """Creates a database connection."""
    conn = sqlite3.connect(DB_PATH)
    conn.row_factory = sqlite3.Row
    return conn

# --- API Routes ---

# This is the route to get ALL sections of the IPC
@app.route('/ipc/all', methods=['GET'])
def get_all_ipc_sections():
    conn = get_db_connection()
    sections_cursor = conn.execute('SELECT * FROM IPC').fetchall()
    conn.close()
    
    # --- DEBUG CODE IS NOW IN THE CORRECT FUNCTION ---
    if sections_cursor:
        first_row = dict(sections_cursor[0])
        print("\n--- DEBUG: Column names found in the database ---")
        print(first_row.keys())
        print("-------------------------------------------------\n")
    # --- END OF DEBUG CODE ---
    
    result = [dict(row) for row in sections_cursor]
    return jsonify(result)


# This is the route to get ONE specific section by its number
# I have also fixed the SQL query here so it works correctly.
@app.route('/ipc/<string:section_no>', methods=['GET'])
def get_ipc_section(section_no):
    conn = get_db_connection()
    # The query now correctly filters for the specific section number
    section_cursor = conn.execute('SELECT * FROM IPC WHERE section = ?', (section_no,)).fetchone()
    conn.close()
    
    if section_cursor is None:
        return jsonify({'error': 'Section not found'}), 404
    else:
        return jsonify(dict(section_cursor))

# --- Run the App ---
if __name__ == '__main__':
    app.run(host='0.0.0.0', debug=True)