# code for deleting ticket
import pandas as pd
import streamlit as st
from database import view_all_tickets, db_delete_ticket


def delete_ticket():
    result = view_all_tickets()

    df = pd.DataFrame(result, columns=[
                      'TID', 'RID', 'Flat', 'Block', 'Is Resolved', 'Complaint', 'Response', 'Date generated'])
    with st.expander("Current Tickets"):
        st.dataframe(df)

    list_of_tickets = [result[i][0] for i in range(len(result))]
    selected_ticket = st.selectbox("Select ticket", list_of_tickets)
    st.warning("Do you want to delete {}?".format(selected_ticket))
    if st.button("Delete"):
        if db_delete_ticket(selected_ticket):
            st.success("Ticket has been deleted successfully!")
        else:
            st.error('Delete Unsuccessful.', icon="🚨")
