{{
    config(
        schema = 'swaap_v2_linea',
        alias ='base_trades',
        materialized = 'incremental',
        file_format = 'delta',
        incremental_strategy = 'merge',
        unique_key = ['tx_hash', 'evt_index'],
        incremental_predicates = [incremental_predicate('DBT_INTERNAL_DEST.block_time')]
    )
}}

{{
    swaap_v2_compatible_trades(
        blockchain = 'linea',
        project = 'swaap',
        version = '2'
    )
}}