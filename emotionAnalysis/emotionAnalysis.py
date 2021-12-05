import numpy as np
import pandas as pd
import jieba
from sklearn.model_selection import train_test_split
from sklearn.feature_extraction.text import CountVectorizer
from sklearn.naive_bayes import MultinomialNB
nb = MultinomialNB()


def make_label(star):
    if star > 4:
        return 1
    else:
        return 0


def chinese_word_cut(mytext):
    return " ".join(jieba.cut(mytext))


def get_custom_stopwords(file):
    with open(file, encoding='GBK') as f:
        words = f.read()
    stopwords_list = words.split('\n')
    custom_stopwords_list = [i for i in stopwords_list]
    return custom_stopwords_list


stop_words_file = './emotionAnalysis/哈工大停用词表.txt'
stopwords = get_custom_stopwords(stop_words_file)

vector = CountVectorizer(
    max_df=0.9,
    min_df=1,
    token_pattern=u'(?u)\\b[^\\d\\W]\\w+\\b',
    stop_words=frozenset(stopwords)
)


def validate(comment):
    cut_comment = chinese_word_cut(comment)
    comment_series = pd.Series(cut_comment)
    comment_vector = vector.transform(comment_series)
    result = nb.predict(comment_vector)
    return result[0]


def train_model():
    data = pd.read_csv('./emotionAnalysis/2.csv')
    data['cut_comment'] = data.comment.apply(chinese_word_cut)
    data['sentiment'] = data.score.apply(make_label)

    X = data['cut_comment']
    y = data.sentiment

    X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.2, random_state=22)

    X_train_vector = vector.fit_transform(X_train)
    nb.fit(X_train_vector, y_train)


if __name__ == '__main__':
    train_model()

