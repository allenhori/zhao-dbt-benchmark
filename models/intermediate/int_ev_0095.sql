select
    p.event_id as event_id,
    p.customer_id as customer_id,
    p.segment_id as segment_id,
    coalesce(p.m10, 0) + 7 as v1,
    p.m12 + p.m10 as v2,
    p.m10 + p.m12 as v3,
    coalesce(p.m3, 0) + 5 as v4,
    p.m10 + 5 as v5,
    p.m12 * 0.5 + p.m10 * 0.5 as v6,
    p.m10 * 5 as v7,
    case when p.m12 > 1300 then p.m12 else 0 end as v8
from {{ ref('stg_ev_03') }} as p
