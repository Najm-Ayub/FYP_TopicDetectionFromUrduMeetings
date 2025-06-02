from flask import Flask, request, jsonify
from flask_cors import CORS
from Urdu_main4 import TextTilingTokenizer

def create_app():
    """
    Factory function to create and configure the Flask application.
    """
    app = Flask(__name__)
    CORS(app)  # Enable CORS for all routes

    # Initialize tokenizer
    tokenizer = TextTilingTokenizer()
    text_tiling_api = TextTilingAPI(tokenizer)

    @app.route('/api/tokenize', methods=['POST'])
    def tokenize_text():
        """
        Endpoint to tokenize input text using the TextTiling algorithm.
        Expects a POST request with 'text' as form data.
        """
        try:
            text = request.form.get('text')

            if not text:
                return jsonify({'error': 'Missing or empty "text" parameter in request'}), 400

            segments = text_tiling_api.process_text(text)
            return jsonify({'segments': segments}), 200

        except Exception as e:
            return jsonify({'error': f'Internal Server Error: {str(e)}'}), 500

    return app


class TextTilingAPI:
    """
    A wrapper class to handle the text segmentation logic using TextTilingTokenizer.
    """

    def __init__(self, tokenizer):
        self.tokenizer = tokenizer

    def process_text(self, text: str):
        """
        Tokenizes the input text into segments using the provided tokenizer.

        :param text: Input string to segment
        :return: List of segmented strings
        """
        return self.tokenizer.tokenize(text)


if __name__ == '__main__':
    # Run the Flask development server
    app = create_app()
    app.run(debug=True, use_reloader=False)
