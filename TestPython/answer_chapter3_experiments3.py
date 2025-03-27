
import pandas as pd

url = "https://raw.githubusercontent.com/noora20FH/skripsi_noora2023/main/clean_movie_data.csv"  # Replace with your actual URL

# Read the CSV directly from the URL

def data_load():
  data_toko = pd.read_csv(url)
  return data_toko


# Convert Critic Score to NumPy array
def critic_scores():
  critic_scores = data_load()["Critic_Score"].to_numpy()
  return critic_scores

# Sort the movies by Critic Score in descending order (highest to lowest)
def sorted_indices():
  sorted_indices = critic_scores().argsort()[::-1]
  return sorted_indices


# Select the top 10 movies
def top_10_movies():
  top_10_movies = data_load().iloc[sorted_indices()[:10]]
  return top_10_movies

# Print Top 10 Movie
print(top_10_movies())