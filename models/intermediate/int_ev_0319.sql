select
    p.event_id as event_id,
    p.customer_id as customer_id,
    p.segment_id as segment_id,
    p.v7 * 2 as v1,
    p.v7 * 13 as v2,
    coalesce(p.v7, 0) + 5 as v3,
    p.v7 * 2 as v4,
    p.v8 + 11 as v5,
    p.v7 - p.v8 as v6,
    case when p.v7 > 200 then p.v7 else 0 end as v7,
    p.v8 * 0.5 + p.v7 * 0.5 as v8
from {{ ref('int_ev_0018') }} as p
where p.customer_id % 97 <> 0
