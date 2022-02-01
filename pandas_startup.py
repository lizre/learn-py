#!/usr/bin/eng python 3
# starting with this ^ "shebang" statement means you don't have to specify python3 when you run

import pandas as pd 

def pandas_startup():
    options = {
        'display': {
            'max_columns': None,
            'expand_frame_repr': False,
            'max_rows': 14,
            'max_seq_items': 50,
            'precision': 4
        }
    }

    for category, option in options.items():
        for op, value in option.items():
            pd.set_option(f'{category}.{op}', value)
