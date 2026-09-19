select
    p.event_id as event_id,
    p.customer_id as customer_id,
    p.segment_id as segment_id,
    p.m6 + 5 as v1,
    coalesce(p.m10, 0) + 13 as v2,
    p.m4 * 5 as v3,
    p.m6 + 13 as v4,
    case when p.m6 > 1100 then p.m6 else 0 end as v5,
    case when p.m4 > 1300 then p.m4 else 0 end as v6,
    case when p.m6 > 700 then p.m6 else 0 end as v7,
    case when p.m4 > p.m10 then p.m4 else p.m10 end as v8
from {{ ref('stg_ev_07') }} as p
where p.customer_id % 97 <> 0
