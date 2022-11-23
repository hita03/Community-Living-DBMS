import streamlit as st
import numpy as np
import plotly.graph_objects as go
import mysql.connector
from database import view_all_tickets
from crud.create import create_ticket
from crud.delete import delete_ticket
from crud.read import read_ticket
from crud.update import update_ticket
from crud.query import query

# st.set_page_config(layout="wide")
########################################
# Utility Code
z = np.linspace(-9, 8, 200)
#########################################


def main():
    st.image('./logo.png')
    # st.title('MyGate')
    st.write("""
        #### A community management app ensuring the safety and convenience of gated societies!
        This software for gated society offers numerous innovative features to help simplify daily chores and improve security standards around gated communities through its Security, Community & Accounting Management modules.
        """
             )
    st.subheader('1. Choose operation on Ticket')
    operation = st.selectbox(
        'select', ['None', 'View', 'Insert', 'Update', 'Delete'])
    if operation == "Insert":
        st.subheader("Raise a ticket")
        st.write('Usability: Resident')
        create_ticket()

    elif operation == "View":
        st.subheader("All tickets")
        st.write('Usability: Resident')
        view_all_tickets()
        read_ticket()

    elif operation == "Update":
        st.subheader("Update ticket ")
        st.write('Usability: Help Desk')
        update_ticket()

    elif operation == "Delete":
        st.subheader("Delete ticket")
        st.write('Usability: Help Desk')
        delete_ticket()

    else:
        pass

    st.subheader("2. Type any SQL query")
    query()


if __name__ == '__main__':
    main()
