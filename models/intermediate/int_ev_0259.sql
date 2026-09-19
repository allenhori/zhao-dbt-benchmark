select
    p.event_id as event_id,
    p.customer_id as customer_id,
    p.segment_id as segment_id,
    coalesce(p.m1, 0) + 5 as v1,
    round(p.m12 / 3.0, 4) as v2,
    p.m11 + 13 as v3,
    case when p.m11 > p.m12 then p.m11 else p.m12 end as v4,
    coalesce(p.m12, 0) + 2 as v5,
    case when p.m11 > 300 then p.m11 else 0 end as v6,
    coalesce(p.m12, 0) + 11 as v7,
    round(p.m1 / 11.0, 4) as v8
from {{ ref('stg_ev_02') }} as p
