select
    p.event_id as event_id,
    p.customer_id as customer_id,
    p.segment_id as segment_id,
    case when p.v3 > p.v4 then p.v3 else p.v4 end as v1,
    case when p.v7 > p.v4 then p.v7 else p.v4 end as v2,
    p.v3 * 11 as v3,
    p.v3 - p.v4 as v4,
    case when p.v3 > 1100 then p.v3 else 0 end as v5,
    case when p.v3 > p.v4 then p.v3 else p.v4 end as v6,
    coalesce(p.v3, 0) + 13 as v7,
    p.v3 - p.v4 as v8
from {{ ref('int_ev_0015') }} as p
where p.customer_id % 97 <> 0
