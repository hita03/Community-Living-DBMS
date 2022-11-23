# code for creating a ticket
import pandas as pd
import streamlit as st
from database import db_create_ticket


def create_ticket():
    col1, col2 = st.columns(2)
    with col2:
        pass
    with col1:
        rid = st.text_input("Resident ID", max_chars=4)
    complaint = st.text_input("Complaint", max_chars=50)
    if st.button("Submit"):

        tid = db_create_ticket(rid, complaint)
        if not tid:
            st.error('Your ticket could not be raised.', icon="🚨")
        else:
            st.success("Your ticket has been raised: Ticket ID {}".format(tid))
