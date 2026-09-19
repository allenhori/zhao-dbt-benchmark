select
    p.event_id as event_id,
    p.customer_id as customer_id,
    p.segment_id as segment_id,
    round(p.m2 / 5.0, 4) as v1,
    round(p.m7 / 2.0, 4) as v2,
    p.m7 * 0.5 + p.m2 * 0.5 as v3,
    p.m2 + 7 as v4,
    p.m7 + p.m2 as v5,
    p.m7 * 13 as v6,
    p.m2 - p.m7 as v7
from {{ ref('stg_ev_03') }} as p
where p.customer_id % 97 <> 0
