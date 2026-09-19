select
    p.event_id as event_id,
    p.customer_id as customer_id,
    p.segment_id as segment_id,
    round(p.m9 / 2.0, 4) as v1,
    p.m9 + p.m5 as v2,
    coalesce(p.m5, 0) + 2 as v3,
    p.m5 + 3 as v4,
    p.m5 - p.m9 as v5,
    coalesce(p.m9, 0) + 3 as v6
from {{ ref('stg_ev_05') }} as p
