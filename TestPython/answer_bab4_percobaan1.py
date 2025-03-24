import pandas as pd
import matplotlib.pyplot as plt

def load_data():
    url = "https://raw.githubusercontent.com/noora20FH/skripsi_noora2023/main/age_group.csv"
    df = pd.read_csv(url)
    return df

def create_pie_chart():
    df = load_data()
    get_population_col = df['Population']
    get_age_col = df['Age Group']

    fig_size = plt.figure(figsize=(10, 8))
    plt.pie(get_population_col, labels=get_age_col, autopct='%1.1f%%', startangle=90)
    plt.legend(title="Age Group")
    plt.title('Age Distribution in the City')
    plt.axis('equal')
    plt.show()

# Call the function to create the pie chart
create_pie_chart()