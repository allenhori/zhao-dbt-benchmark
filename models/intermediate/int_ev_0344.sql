select
    p.event_id as event_id,
    p.customer_id as customer_id,
    p.segment_id as segment_id,
    p.m7 * 2 as v1,
    case when p.m3 > 1300 then p.m3 else 0 end as v2,
    p.m11 + p.m7 as v3,
    p.m3 + 7 as v4,
    case when p.m3 > 500 then p.m3 else 0 end as v5,
    round(p.m3 / 5.0, 4) as v6,
    case when p.m7 > p.m3 then p.m7 else p.m3 end as v7,
    p.m7 * 0.5 + p.m11 * 0.5 as v8
from {{ ref('stg_ev_07') }} as p
