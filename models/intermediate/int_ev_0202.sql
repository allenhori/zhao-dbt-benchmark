select
    p.event_id as event_id,
    p.customer_id as customer_id,
    p.segment_id as segment_id,
    coalesce(p.m9, 0) + 3 as v1,
    coalesce(p.m11, 0) + 7 as v2,
    round(p.m9 / 5.0, 4) as v3,
    p.m9 * 0.5 + p.m11 * 0.5 as v4,
    coalesce(p.m9, 0) + 13 as v5,
    round(p.m11 / 13.0, 4) as v6,
    p.m9 - p.m12 as v7,
    p.m9 + 13 as v8
from {{ ref('stg_ev_07') }} as p
