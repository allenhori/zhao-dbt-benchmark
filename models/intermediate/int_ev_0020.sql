select
    p.event_id as event_id,
    p.customer_id as customer_id,
    p.segment_id as segment_id,
    round(p.m4 / 11.0, 4) as v1,
    round(p.m4 / 11.0, 4) as v2,
    round(p.m4 / 5.0, 4) as v3,
    p.m4 - p.m7 as v4,
    p.m7 + 13 as v5,
    p.m7 - p.m4 as v6,
    round(p.m4 / 3.0, 4) as v7
from {{ ref('stg_ev_00') }} as p
where p.customer_id % 97 <> 0
