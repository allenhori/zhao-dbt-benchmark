select
    p.event_id as event_id,
    p.customer_id as customer_id,
    p.segment_id as segment_id,
    p.m11 - p.m1 as v1,
    case when p.m1 > 500 then p.m1 else 0 end as v2,
    p.m11 * 2 as v3,
    round(p.m1 / 3.0, 4) as v4,
    coalesce(p.m11, 0) + 5 as v5,
    p.m11 * 0.5 + p.m1 * 0.5 as v6,
    p.m11 * 0.5 + p.m1 * 0.5 as v7,
    p.m1 * 0.5 + p.m11 * 0.5 as v8
from {{ ref('stg_ev_03') }} as p
where p.customer_id % 97 <> 0
