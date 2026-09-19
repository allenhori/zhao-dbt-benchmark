select
    p.event_id as event_id,
    p.customer_id as customer_id,
    p.segment_id as segment_id,
    p.m11 + p.m12 as v1,
    coalesce(p.m1, 0) + 11 as v2,
    p.m11 + p.m12 as v3,
    p.m1 + 2 as v4,
    p.m12 + 7 as v5,
    coalesce(p.m11, 0) + 7 as v6,
    p.m1 * 13 as v7,
    p.m1 - p.m12 as v8
from {{ ref('stg_ev_07') }} as p
