"""
Entrypoint for streamlit app.
Runs top to bottom every time the user interacts with the app (other than imports and cached functions).
"""
from pathlib import Path
import sys
path_root = Path(__file__).parents[1]
print(path_root)
sys.path.append(str(path_root))
# Library imports
import traceback
import copy

import streamlit as st


from utils.page_components import (
    add_common_page_elements,
)

sidebar_container = add_common_page_elements()
page_container = st.sidebar.container()
sidebar_container = st.sidebar.container()

st.divider()

displaytext = """## About Twelve GPT Educational """

st.markdown(displaytext)

displaytext = (
    """This app analyzes and describes the expected threat (xT) of football passes using various machine learning and explainability methods. It provides visualizations and AI-generated commentary to help users understand what makes a pass valuable, using models like XGBoost and xNN, as well as SHAP for feature contributions.\n\n"""
    """The project was developed as part of a research-driven initiative to explore interpretable football analytics. It is designed to support scouts, analysts, and enthusiasts in gaining insights into passing decisions through explainable AI. \n\n"""
    """The full codebase is available at [GitHub Repository](https://github.com/Peggy4444/passesGPT/tree/main), and contributions or feedback are welcome. \n\n"""
    """This app builds on the educational spirit of tools like TwelveGPT, aiming to make football data science more accessible. While it is not affiliated with the TwelveGPT product, it shares a similar philosophy of using data to support storytelling and decision-making in football."""
)


st.markdown(displaytext)
