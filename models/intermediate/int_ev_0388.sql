select
    p.event_id as event_id,
    p.customer_id as customer_id,
    p.segment_id as segment_id,
    p.m5 + 11 as v1,
    p.m9 + p.m2 as v2,
    p.m9 + 5 as v3,
    coalesce(p.m5, 0) + 7 as v4,
    p.m9 + 11 as v5,
    p.m5 + 11 as v6,
    p.m9 * 3 as v7
from {{ ref('stg_ev_06') }} as p
