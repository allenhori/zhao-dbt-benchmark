select
    p.event_id as event_id,
    p.customer_id as customer_id,
    p.segment_id as segment_id,
    round(p.m6 / 13.0, 4) as v1,
    case when p.m6 > 300 then p.m6 else 0 end as v2,
    case when p.m6 > p.m5 then p.m6 else p.m5 end as v3,
    case when p.m5 > p.m6 then p.m5 else p.m6 end as v4,
    round(p.m5 / 2.0, 4) as v5,
    coalesce(p.m5, 0) + 3 as v6,
    coalesce(p.m5, 0) + 5 as v7,
    round(p.m6 / 3.0, 4) as v8
from {{ ref('stg_ev_00') }} as p
where p.customer_id % 97 <> 0
