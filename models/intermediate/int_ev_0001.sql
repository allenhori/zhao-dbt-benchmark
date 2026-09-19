select
    p.event_id as event_id,
    p.customer_id as customer_id,
    p.segment_id as segment_id,
    round(p.m2 / 11.0, 4) as v1,
    p.m7 + 2 as v2,
    p.m2 * 3 as v3,
    p.m2 * 0.5 + p.m7 * 0.5 as v4,
    round(p.m2 / 13.0, 4) as v5,
    coalesce(p.m7, 0) + 3 as v6,
    p.m7 - p.m2 as v7,
    p.m7 + 2 as v8
from {{ ref('stg_ev_00') }} as p
