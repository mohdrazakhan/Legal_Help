import sqlite3
import re # Import the regular expression library
from flask import Flask, jsonify
from flask_cors import CORS

# --- App Setup ---
app = Flask(__name__)
CORS(app)

DB_PATH = './indialaw.db'
ALLOWED_TABLES = {'IPC', 'CRPC', 'CPC', 'IEA', 'HMA', 'IDA', 'MVA', 'NIA'}

# --- NEW: Text Sanitizer Function ---
def sanitize_text(text):
    """Cleans up text by removing extra whitespace and newlines."""
    if not text:
        return ""
    # Replace newlines and tabs with a space
    text = re.sub(r'[\n\t]+', ' ', text)
    # Replace multiple spaces with a single space
    text = re.sub(r'\s+', ' ', text)
    return text.strip()

def get_db_connection():
    conn = sqlite3.connect(DB_PATH)
    conn.row_factory = sqlite3.Row
    return conn

# --- Updated API Routes ---

@app.route('/api/act/<string:act_name>', methods=['GET'])
def get_all_sections_from_act(act_name):
    if act_name.upper() not in ALLOWED_TABLES:
        return jsonify({'error': f'Act "{act_name}" not found'}), 404
    
    conn = get_db_connection()
    query = f'SELECT * FROM {act_name.upper()}'
    sections_cursor = conn.execute(query).fetchall()
    conn.close()
    
    # Apply the sanitizer to the description of each section
    result = []
    for row in sections_cursor:
        row_dict = dict(row)
        if 'section_desc' in row_dict and row_dict['section_desc']:
            row_dict['section_desc'] = sanitize_text(row_dict['section_desc'])
        result.append(row_dict)
        
    return jsonify(result)

@app.route('/api/act/<string:act_name>/<string:section_no>', methods=['GET'])
def get_specific_section(act_name, section_no):
    if act_name.upper() not in ALLOWED_TABLES:
        return jsonify({'error': f'Act "{act_name}" not found'}), 404
        
    conn = get_db_connection()
    query = f'SELECT * FROM {act_name.upper()} WHERE Section = ?'
    section_cursor = conn.execute(query, (section_no,)).fetchone()
    conn.close()
    
    if section_cursor is None:
        return jsonify({'error': 'Section not found'}), 404
    else:
        # Also apply the sanitizer here
        row_dict = dict(section_cursor)
        if 'section_desc' in row_dict and row_dict['section_desc']:
            row_dict['section_desc'] = sanitize_text(row_dict['section_desc'])
        return jsonify(row_dict)

# --- Run the App ---
if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000, debug=True)