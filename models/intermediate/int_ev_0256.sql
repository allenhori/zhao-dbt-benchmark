select
    p.event_id as event_id,
    p.customer_id as customer_id,
    p.segment_id as segment_id,
    p.m2 * 3 as v1,
    p.m2 + 3 as v2,
    p.m1 - p.m4 as v3,
    case when p.m2 > 300 then p.m2 else 0 end as v4,
    round(p.m2 / 5.0, 4) as v5,
    p.m1 + 13 as v6,
    p.m4 * 7 as v7,
    case when p.m4 > 300 then p.m4 else 0 end as v8
from {{ ref('stg_ev_00') }} as p
where p.customer_id % 97 <> 0
