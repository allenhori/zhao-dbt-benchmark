select
    p.event_id as event_id,
    p.customer_id as customer_id,
    p.segment_id as segment_id,
    case when p.m12 > p.m7 then p.m12 else p.m7 end as v1,
    coalesce(p.m12, 0) + 7 as v2,
    case when p.m2 > p.m7 then p.m2 else p.m7 end as v3,
    p.m2 * 3 as v4,
    p.m7 * 0.5 + p.m12 * 0.5 as v5,
    p.m2 - p.m12 as v6,
    case when p.m12 > 1100 then p.m12 else 0 end as v7,
    p.m7 + p.m12 as v8
from {{ ref('stg_ev_03') }} as p
