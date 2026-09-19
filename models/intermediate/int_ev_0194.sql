select
    p.event_id as event_id,
    p.customer_id as customer_id,
    p.segment_id as segment_id,
    p.m1 + 13 as v1,
    p.m1 - p.m10 as v2,
    p.m1 * 5 as v3,
    p.m1 * 0.5 + p.m10 * 0.5 as v4,
    p.m10 + 11 as v5,
    round(p.m1 / 13.0, 4) as v6
from {{ ref('stg_ev_04') }} as p
