select
    p.event_id as event_id,
    p.customer_id as customer_id,
    p.segment_id as segment_id,
    p.m12 * 5 as v1,
    case when p.m9 > 1300 then p.m9 else 0 end as v2,
    p.m1 * 0.5 + p.m12 * 0.5 as v3,
    p.m1 - p.m9 as v4,
    round(p.m12 / 2.0, 4) as v5,
    p.m12 + 3 as v6,
    p.m12 * 2 as v7,
    coalesce(p.m1, 0) + 7 as v8
from {{ ref('stg_ev_02') }} as p
where p.customer_id % 97 <> 0
