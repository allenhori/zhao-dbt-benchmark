select
    p.event_id as event_id,
    p.customer_id as customer_id,
    p.segment_id as segment_id,
    case when p.m10 > p.m4 then p.m10 else p.m4 end as v1,
    p.m10 * 0.5 + p.m4 * 0.5 as v2,
    coalesce(p.m10, 0) + 7 as v3,
    coalesce(p.m10, 0) + 3 as v4,
    p.m10 + p.m4 as v5,
    case when p.m4 > 1300 then p.m4 else 0 end as v6,
    case when p.m4 > 1100 then p.m4 else 0 end as v7,
    p.m10 * 2 as v8
from {{ ref('stg_ev_05') }} as p
