# handles any sql query 
import pandas as pd
import streamlit as st
from database import *
# from texttable import Texttable


def query():
    q = st.text_input("Enter")
    if st.button("Go"):
        try:
            result = db_any_query(q)
            st.success("Success!")

            df = pd.DataFrame(result)
            st.dataframe(df)
            # st.write(result)
        except:
            st.error('Unsuccessful', icon="🚨")
    

