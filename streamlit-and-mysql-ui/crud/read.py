# code for read
import pandas as pd
import streamlit as st
from database import view_all_tickets


def read_ticket():
    result = view_all_tickets()
    # st.write(result)
    df = pd.DataFrame(result, columns=[
                      'TID', 'RID', 'Flat', 'Block', 'Is Resolved', 'Complaint', 'Response', 'Date generated'])
    # with st.expander("View all tickets"):
    st.dataframe(df)
