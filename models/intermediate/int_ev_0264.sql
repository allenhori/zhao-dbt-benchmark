select
    p.event_id as event_id,
    p.customer_id as customer_id,
    p.segment_id as segment_id,
    p.m5 * 13 as v1,
    p.m4 + p.m5 as v2,
    coalesce(p.m4, 0) + 3 as v3,
    case when p.m4 > p.m5 then p.m4 else p.m5 end as v4,
    case when p.m4 > 1300 then p.m4 else 0 end as v5,
    case when p.m4 > 1100 then p.m4 else 0 end as v6,
    p.m7 - p.m5 as v7,
    p.m7 * 0.5 + p.m4 * 0.5 as v8
from {{ ref('stg_ev_01') }} as p
where p.customer_id % 97 <> 0
