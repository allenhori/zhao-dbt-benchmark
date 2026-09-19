select
    p.event_id as event_id,
    p.customer_id as customer_id,
    p.segment_id as segment_id,
    case when p.v1 > p.v2 then p.v1 else p.v2 end as v1,
    p.v2 * 3 as v2,
    p.v7 * 0.5 + p.v2 * 0.5 as v3,
    coalesce(p.v1, 0) + 11 as v4,
    case when p.v1 > 200 then p.v1 else 0 end as v5,
    p.v2 + 2 as v6
from {{ ref('int_ev_0015') }} as p
where p.customer_id % 97 <> 0
