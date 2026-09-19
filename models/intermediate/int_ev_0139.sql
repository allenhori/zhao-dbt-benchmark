select
    p.event_id as event_id,
    p.customer_id as customer_id,
    p.segment_id as segment_id,
    case when p.v3 > 1100 then p.v3 else 0 end as v1,
    coalesce(p.v3, 0) + 5 as v2,
    p.v7 + 7 as v3,
    p.v4 + 3 as v4,
    p.v7 * 0.5 + p.v4 * 0.5 as v5,
    p.v4 * 2 as v6,
    case when p.v3 > 200 then p.v3 else 0 end as v7,
    p.v7 * 2 as v8
from {{ ref('int_ev_0001') }} as p
where p.customer_id % 97 <> 0
