select
    p.event_id as event_id,
    p.customer_id as customer_id,
    p.segment_id as segment_id,
    p.m4 * 11 as v1,
    p.m3 * 0.5 + p.m4 * 0.5 as v2,
    coalesce(p.m4, 0) + 2 as v3,
    coalesce(p.m4, 0) + 13 as v4,
    p.m3 + p.m4 as v5,
    round(p.m4 / 5.0, 4) as v6,
    (p.m4 + p.m3) * 1.1 as v7,
    round(p.m4 / 5.0, 4) as v8
from {{ ref('stg_ev_00') }} as p
