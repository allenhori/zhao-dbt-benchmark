select
    event_id,
    customer_id,
    segment_id,
    m1 as m1,
    m2 as m2,
    m3 as m3,
    m4 as m4,
    m5 as m5,
    m6 as m6,
    m7 as m7,
    m8 as m8,
    m9 as m9,
    m10 as m10,
    m11 as m11,
    m12 as m12
from {{ source('raw', 'ev_02') }}
