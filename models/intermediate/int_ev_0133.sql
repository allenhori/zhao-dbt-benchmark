select
    p.event_id as event_id,
    p.customer_id as customer_id,
    p.segment_id as segment_id,
    coalesce(p.m7, 0) + 3 as v1,
    p.m5 * 2 as v2,
    coalesce(p.m7, 0) + 11 as v3,
    p.m7 + 5 as v4,
    coalesce(p.m5, 0) + 7 as v5,
    p.m5 + p.m7 as v6,
    p.m5 * 5 as v7
from {{ ref('stg_ev_00') }} as p
