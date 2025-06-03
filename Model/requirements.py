# first.py
"""
This script ensures the NLTK stopwords corpus is downloaded.
"""

import nltk

def download_stopwords():
    nltk.download('stopwords')
    print("Stopwords downloaded successfully.")

if __name__ == "__main__":
    download_stopwords()
