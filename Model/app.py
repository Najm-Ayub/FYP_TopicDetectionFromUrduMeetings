

from flask import Flask, request, jsonify
from flask_cors import CORS
from Urdu_main4 import TextTilingTokenizer

app = Flask(__name__)
CORS(app)  # Enable CORS for all routes

class TextTilingAPI:
    def __init__(self, tokenizer):
        self.tokenizer = tokenizer

    def process_text(self, text):
        segments = self.tokenizer.tokenize(text)
        return segments

# Initialize the API with the TextTilingTokenizer
text_tiling_api = TextTilingAPI(TextTilingTokenizer())

@app.route('/api/tokenize', methods=['POST'])
def tokenize_text():
    try:
        # Check if the post request has the text part
        if 'text' not in request.form:
            return jsonify({'error': 'No text part or incorrect key name. Use "text" as the key in your request.'}), 400

        text = request.form['text']

        if not text:
            return jsonify({'error': 'Empty text provided'}), 400

        segments = text_tiling_api.process_text(text)
        return jsonify({'segments': segments})
    except Exception as e:
        return jsonify({'error': str(e)}), 400

if __name__ == '__main__':
    app.run(debug=True, use_reloader=False)


