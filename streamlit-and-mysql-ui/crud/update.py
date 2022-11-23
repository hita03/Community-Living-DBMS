# code for updating a ticket
import pandas as pd
import streamlit as st
from database import view_all_tickets, db_get_ticket, db_update_ticket


def update_ticket():
    result = view_all_tickets()
    unresolved_tickets = []
    for i in range(len(result)):
        if not result[i][4]:
            unresolved_tickets.append(result[i])

    st.write("""
        Tickets once resolved, cannot be updated.
        Note that this functionality is for tickets that are unresolved.
    """)
    df = pd.DataFrame(unresolved_tickets, columns=[
                      'TID', 'RID', 'Flat', 'Block', 'Is Resolved', 'Complaint', 'Response', 'Date generated'])
    with st.expander("Unresolved Tickets"):
        st.dataframe(df)

    list_of_tickets = [unresolved_tickets[i][0]
                       for i in range(len(unresolved_tickets))]

    selected_ticket = st.selectbox("List of tickets", list_of_tickets)
    selected_result = db_get_ticket(selected_ticket)

    if selected_result:

        # Layout of Update
        col1, col2 = st.columns(2)
        with col1:
            new_ticket_status = st.number_input(
                "Status", selected_result[0][4], max_value=1)
        with col2:
            pass
        new_ticket_response = st.text_input(
            "Log a response", selected_result[0][6])
        if st.button("Update"):
            if db_update_ticket(selected_result[0][0], new_ticket_status, new_ticket_response):
                st.success("Update Succesful!")
            else:
                st.error('Update Unsuccessful.', icon="🚨")
