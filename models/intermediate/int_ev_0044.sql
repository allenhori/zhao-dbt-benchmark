select
    p.event_id as event_id,
    p.customer_id as customer_id,
    p.segment_id as segment_id,
    case when p.v1 > 300 then p.v1 else 0 end as v1,
    p.v1 + 7 as v2,
    p.v8 + 7 as v3,
    case when p.v1 > 1100 then p.v1 else 0 end as v4,
    coalesce(p.v1, 0) + 7 as v5,
    coalesce(p.v1, 0) + 3 as v6,
    case when p.v8 > 200 then p.v8 else 0 end as v7
from {{ ref('int_ev_0001') }} as p
where p.customer_id % 97 <> 0
