select
    p.event_id as event_id,
    p.customer_id as customer_id,
    p.segment_id as segment_id,
    coalesce(p.m2, 0) + 5 as v1,
    coalesce(p.m1, 0) + 2 as v2,
    coalesce(p.m2, 0) + 13 as v3,
    p.m1 - p.m2 as v4,
    p.m2 * 13 as v5,
    p.m2 * 0.5 + p.m1 * 0.5 as v6,
    p.m1 * 7 as v7
from {{ ref('stg_ev_06') }} as p
