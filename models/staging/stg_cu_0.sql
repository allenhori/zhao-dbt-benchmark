select
    customer_id,
    segment_id,
    a1 as a1,
    a2 as a2,
    a3 as a3,
    a4 as a4,
    a5 as a5,
    a6 as a6
from {{ source('raw', 'cu_0') }}
